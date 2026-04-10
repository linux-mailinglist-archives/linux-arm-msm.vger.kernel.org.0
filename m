Return-Path: <linux-arm-msm+bounces-102589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDg3ONOO2GntfAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:46:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE7F3D25ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 07:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EC733018AEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 05:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF8533438F;
	Fri, 10 Apr 2026 05:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fW7Yvbv3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZnZdc7/E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F2B2DC767
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 05:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775800012; cv=none; b=IXa0cPSkswgG+7Hne9zdgqBjk4EBzlzBnmBLnJB0J6WT0Fv5CVjanAICRn983rpwYI0JZblHKe5624MhZWbKAACZMoINlEUxRBriquoYUElNHQRCYKRqyJdE/ICldQ/3ql7bCRVE0H33mLESUpFI2n+cxAEd9tH3vSbgxYGJANQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775800012; c=relaxed/simple;
	bh=fVzL+sSlRd/KUXDLXjHDnh2hdZ+3zOivohmQPs8xrBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IptKxJOkbpXVomuzzfiRfKf+8gu7AiVKJCCJIS08gDjfIFhJ77vlJBi5sGtIAPq/mDkEM0t8uneKs1IyWdARLPGe5oITzhyBhNuGneXYlpcvKxKwYIRVGnn+csqM+SO4gkN7msYQNHp5d9oXnaF26h0mnp2PA3SFWCgAzZvBp4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fW7Yvbv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZnZdc7/E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5Iw843352581
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 05:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=; b=fW7Yvbv3HxYGOLVw
	G2nvFRqIJSayLL1KpAL4BDQiL0UzERgrY8ZutytnpNdpckuepgm7r+NiEMjCJ9PA
	NeO5UPKcX7WlqcaghjeEnGBuscga0ehBLsGvuAkAmMtg6P/dVlkrsB6BkPepEOG8
	M2rOR5lhdtNNr7CRMBufIMdQggx+sY9e34TAqGQZeDGuK7Ld1UiHMV0BPBzNBzbg
	Yf/U3ztKrj1CS+7b7Eohk7rogzCc3jCjbui9rTkEXMWjl49fHLZhHgFd/tDeCTpD
	djs5PayfXDDKMHmhUr5Wv6LioMl5WTCXlwpB/CltScmEqVYNz556xA1GdGcg2loH
	z8L45w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qu3d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 05:46:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35842aa350fso3550650a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 22:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775800009; x=1776404809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=;
        b=ZnZdc7/E2/ji73pPliptNhTBJgxTWX0nvX1uzNw/T+xyvx0/hSja2qgOrhZTFRvLvp
         BQ9RdFQiodmQLmgmkCa7XNxy5+6JQpJEUZWvqE5firv+nCyMC+5ptzqrvozr014JRhuK
         uJk/06W+CfVx5hulZMitCyu5Bap+JQK2FdjNeVPuw4RACAV7rH21076fwc7yj3/h6Htc
         NDCludImtElOktnHVdNxJiCz5sc8GXrNvdHp/f4U3yNPLOVOXMqfFUyBpMYXRYhIhkem
         RtH8wdjOntA74BMgn7UBs7rJOBUHZRmEh78WDvdA0wedIlKlZjc9IS+5VgckaUBtM+4M
         dNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775800009; x=1776404809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=;
        b=PKIXvneGuzVhYtK03iqz0GxpGsYmDQogvRyLePpjpx5hdBjWZ5p64rcKfbOM/1mxFG
         43Khp5dXg1A/JFIYyG9VDCh1j8FJl0lyQp16OGYYuAP2kRN3q9aCyIQNbm8+Smx6J05b
         0O8pkwUyIMwlzfutaysNzOs6i/AL4D0fYYrA6hdcknP8hyHHpeVIId+DAYj79/gduTn3
         zWBm11T+Oz8Djh29ORtwg9UazqqpaKMEoxVzt957mrxZE6AY5RpuOg7lYovgW9YvG5gL
         EneKVyexIPvwgs3imW24n/xK2lKYsxnCA7SKPU0WqCWZieD1TPKrTMkBzvxCjznJoOsN
         A75g==
X-Forwarded-Encrypted: i=1; AJvYcCXky+4Ba8Of3l97ZH3IG1Hd/CYlwkc+QN+qVyPQN4qYksRh2M8hH186uKCmOyXOm3DAfYmUB5VhDzhXjsn7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1t4eQuJQlzhqWeK2r2ZLHxdMe0N0mXVhbkwOP/tkDegBYmkl5
	v3G1024beqEnWv0hT0Z8gDiOHNYLkJACpHFcoNm60bVv19WJs7CTANLFq2GgpDDuSTHJFKaL/rN
	0ymSL8qKr2F3ju8YD7gxPnUh0dfcQFTJNX72t620rpHDphFWpfAhqFEDDF+2f8iC98cer
X-Gm-Gg: AeBDiesuU6o+uszgrv0NdF3Iax5eYDmH8kOgPnRdY3nvTK9+Exo0XLnHtrQKLMKQ6Qk
	4fYz6NiLI3Gv6MajHFdS08YvOdg6izHCzT1EZbzs3cTRbmMuBzFckDzNgG1VqzwTSiXLwcnlo7s
	VYOlGyWbx5iC2D38lNmXQBlPhcsdnx0QvzsrnnUj6wKZwYA8nZUp7bwL839qPGdTS7skdqz/xUw
	aXF0kDnz0zdTmhhGHGwMCTFhTFlO2zhHWJvLWy17txuoy7v1MussnKxzmCwhCtPoE01c5zx087l
	HMEZCa5es+FYMcaaPx+/60+pZBlkJDdwuberHjVrf+aYvMH6cfLSIC5Vq7yNzjRebtZ5bcRkcUh
	oP/yZqjxoEgqnbxM3V6L/WbAw/Sflc6/JuTvYeS01XylJjIsI/g==
X-Received: by 2002:a17:90b:5746:b0:35d:a861:36de with SMTP id 98e67ed59e1d1-35e42853531mr2026765a91.24.1775800008950;
        Thu, 09 Apr 2026 22:46:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5746:b0:35d:a861:36de with SMTP id 98e67ed59e1d1-35e42853531mr2026730a91.24.1775800008479;
        Thu, 09 Apr 2026 22:46:48 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4e16930sm14363155ad.36.2026.04.09.22.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 22:46:48 -0700 (PDT)
Message-ID: <7c244d02-ebef-4a75-b1b2-f55f8ce7c8dc@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:16:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] clk: qcom: videocc: Add video clock controller
 driver for Eliza
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-4-bc0c6dd77bc5@oss.qualcomm.com>
 <c7706c41-d855-4ed4-92c4-dca43c8f6d2a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <c7706c41-d855-4ed4-92c4-dca43c8f6d2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA1MSBTYWx0ZWRfX+f2MDuN7ibtz
 POiYfQCxK0p/rBQdunp26Ch0gzjukGXkEzqVs4WGbAhUirBEra10WAkZdbMmofcHfEklnvVyVmy
 8CHGKN7sTHi8eHVNd4iL/zxAc1D0u8mwIg96e6tKpz9HHUqUACvlZNkDDLepxQI6BdHemZv7Bq2
 VKOvhU/Yj7dFTjFq+55UR4kEiCcwyEWM9pY5AZjMQWbfFQV2hKOrj2P8WhYt7Y4CTFdv77JltbZ
 vUR76+pPuPCMHxo27KwokzNCmvP4X7LBWefdhEvltkIFS+jNl36nsq+xaK5zd6RpxStVEslLC6K
 U5n7GLrXpS3YN0gPLRCfBPiIT+O5CtUBo+aXdgU0TjEOtSuUj3Xc5mxy+jz4QuLYTtYMQ6Hp8+t
 eyvDeuZuwd6wxdTBNOALYy3RG0fAs2KbKMmz0gfbldo3MZB07QdwHXAGRMHAJgnxfRTQSe+dBTe
 GBWp42f9UM8mN3cpwMQ==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d88ec9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=xLwlGchuUDJACbqrD4cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: anHOS5sSVoTy5EoW-3HklQPUuoQ0CMr-
X-Proofpoint-ORIG-GUID: anHOS5sSVoTy5EoW-3HklQPUuoQ0CMr-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100051
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102589-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8AE7F3D25ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/10/2026 10:18 AM, Jie Gan wrote:
>> +    depends on ARM64 || COMPILE_TEST
>> +    select CLK_GLYMUR_GCC
> 
> Hi,
> 
> My bot found a [BUG] here, please ignore it if it's a false positive issue.
> 
> CLK_ELIZA_VIDEOCC selects CLK_GLYMUR_GCC instead of CLK_ELIZA_GCC
> 
> - select CLK_GLYMUR_GCC pulls in gcc-glymur.c instead of gcc-eliza.c
> - On an Eliza system, gcc-glymur.c will never probe (no matching DTS
> node), so GCC_VIDEO_AHB_CLK from the Eliza GCC will never be available
> to videocc
> - The videocc driver's clocks = <&gcc GCC_VIDEO_AHB_CLK> will fail to
> resolve at runtime
> - The correct fix is select CLK_ELIZA_GCC, consistent with all other
> Eliza clock controllers
> 

Thanks, Jie for pointing out, will fix this.

GCC of ELIZA is already 'y' and Video driver probes as this
GCC_VIDEO_AHB_CLK is kept enabled/critical.

Please find the 'clk_summary' from device.

       bi-tcxo-div2-clk              1       1        0        19200000
  0          0     50000      Y         deviceless
no_connection_id
          video_cc_xo_clk_src        0       0        0        19200000
  0          0     50000      ?            deviceless
  no_connection_id
             video_cc_mvs0_shift_clk 0       0        0        19200000
  0          0     50000      N               deviceless
     no_connection_id
             video_cc_mvs0c_shift_clk 0       0        0        19200000
   0          0     50000      N               deviceless
      no_connection_id
          video_cc_pll0              0       0        0        576000000
  0          0     50000      N            deviceless
  no_connection_id
          video_cc_mvs0_clk_src      0       0        0        19200000
  0          0     50000      ?            deviceless
  no_connection_id
             video_cc_mvs0c_div2_div_clk_src 0       0        0
9600000     0          0     50000      Y               deviceless
               no_connection_id
                video_cc_mvs0c_clk   0       0        0        9600000
  0          0     50000      N                  deviceless
        no_connection_id
             video_cc_mvs0_div_clk_src 0       0        0        6400000
    0          0     50000      Y               deviceless
       no_connection_id
                video_cc_mvs0_clk    0       0        0        6400000
  0          0     50000      N                  deviceless
        no_connection_id
          video_cc_ahb_clk_src       0       0        0        19200000
  0          0     50000      ?            deviceless
  no_connection_id



-- 
Thanks,
Taniya Das


