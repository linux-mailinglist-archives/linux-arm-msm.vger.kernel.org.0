Return-Path: <linux-arm-msm+bounces-112686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3ZguNAmDKmr2rQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:42:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 662CD670843
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:42:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BGMq06E3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HqORIbJc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112686-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112686-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 032343201EAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3A83C062C;
	Thu, 11 Jun 2026 09:40:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADDF3233E8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:40:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170853; cv=none; b=bvJIUbdCva2OwUt1AOb6zI8S4sXjQbWqEhnFNtIrpdr0mvrKdiUHO3Vc5bn3vvXx1IJNsKpbc/ud/vuhCnMbaxF+LT2P7YH8nbEpTij7QmgWUyaOUWntyp4NN2t0loJw1T/DIf6eeRvh4fWB8eTm5czCEwKNBdvsrsXMpQ0MZZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170853; c=relaxed/simple;
	bh=/tPLp0YnAEbzNEjlPFUBlDrqdFYNHeb+WcToziZLGSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTljENscLbfhmsHdfT4mhldSGTvEZF4D8XX17Om8r3dZEZxxC8C+CzqskZltl1yj4UxtSyE5m5tsd0UbjWlSq2VmWTZTSlfsU3zNGDC7z5e40eYEvcnnS+/jcgdaaBonA46JF/LX1AwWCl3Fb8q5tA4P0ad4EdFA6KR25J2breo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGMq06E3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqORIbJc; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5Gsrw3813068
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nKcvGnq/VpeslsAPlHl1255rnIM6NR1gO7P4RmE+qE4=; b=BGMq06E3/iit69Oc
	hkkdp21erXxDRMwzvyQJ0zUx60JcLRhrbh+Rch81CF/m+0Nu6/YVhp0RyrWF6ntZ
	lT+nSbCMrPurgIrKgfoSkNBLhXZad/QcYGp5C1lpCVZrpSBGupvOJsIeXibGGlAP
	OP2vKfLkkf/3MiZl/RKZTuFrET/EUYUANxn2FhRkYpnM4lk9eOOv07mELtLoErHm
	So1E/2tkPeP5y+fmNxbaJy+h9cMA6IWAaI5gZyrxBs2gTbHiilt/hHkyZZurzSXW
	2nYjgwzPVotWRwW5SIpzgTthMDQnl4Fw6UMuvW8e365KnDhwinsQg98QKoh2QWVa
	WXFLhA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe71juj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:40:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5176891d0a9so19797991cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781170849; x=1781775649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKcvGnq/VpeslsAPlHl1255rnIM6NR1gO7P4RmE+qE4=;
        b=HqORIbJcn0cEwmHlh3fSD7V8tqwKCLjVmk/XdORU/uuh5Gm0y+Khk3/EuzLqLfTTSp
         Alo+aDB3copLMBIP/KxiCdx5IaugUzLAV1izrGu2NlZZdPohKjCH5tegmc0nxWkeAkxe
         XKY+2Sgo+o45z4SQXdDr0SatrPFle8Y2qzThM+c3PWT3QXmfG+2rmj3QW2ifFtY4tGi7
         DV2eXe0TwSPetj/9FxW56BJs07Rj6jwCOTcaFvcqW2TKx8IOpkHrilcddBoRuIDYiYav
         WgTpcwdfmyYO0VcO2GvKkDhu0Prb5qx+oIZlrv0/rhPwCk4b8NiQAGOedbKpmCejZ8hN
         4qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170849; x=1781775649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKcvGnq/VpeslsAPlHl1255rnIM6NR1gO7P4RmE+qE4=;
        b=q519IBet2q+irk7+BHjIcwybxlNL7SWnpqJqcU+hBI7a0H3ReVui1tAh/Ac1Flqpao
         51VDaukwqlWK9vcqRvey5PtziNDOwyxwk3/vaCJFF/5pRwWfOnWxljnYXxs5AHj1zoKv
         oI/PzBwNHMWn6DHar9wQWQxNxiSPEitKKwnf5uUHP56jIvo4SbMPhNPS//Eqeozswt00
         1AxlIBBivBfV8vx1shpKVXu0M+/m7Kd2Q16GAbPM5X7KHkRUJ9VA6NykiVSHpuXXf3H6
         9CD+krO3Bvltlg9VqhzlNVIwtZLT+RnFLw606fu/b0mFreCtrtyfbApmS2lWIF/lKy/s
         fp0A==
X-Forwarded-Encrypted: i=1; AFNElJ+lNBRsthUW0M6E5RvrhPCIKuN451+RvLAGU+JvTxAlXmS7JE8BdMA2f09gGCU2azE2FzWl2joQfzlspMGp@vger.kernel.org
X-Gm-Message-State: AOJu0YzBKKofNiYmhxChtbZXaxj+jeqFNq8WSoa05zZ+2978iY1tU7PT
	PEsu+/q1Z2YVO9VCIu8j+tiDA7wYDwvcD+C1OQggFQzbOoHMkdTI1jaxu29ItXgTvpiN9KMWLZR
	eBvPaIUsmR014vx3PcD2paODYgawwxp2Mvh7qRv+FqS6HLB+p4YGTCHh8edg8hteq6sg/
X-Gm-Gg: Acq92OEV8pmPh0g8VTnMQjyO5SCEnvpxilhQN80VTcyzqVJpCFxC0I9XGltIefof5JI
	//WQPVLKxqSIM5Di9ViqOJcdciCzHHhfPRFFO2rnVyGPnjD36h1wpPxZ+HcWj+/aY8GS4aCJcyd
	dr1KYxlxUaXzVsVFLuEtX8OWjVfq2DCAxbKGYiryDTA23naGJlLWJOMarOtalWjwbFFJmv+stA3
	PPSNRKbWMyxSNNGjycXx3c7vMzjUVfzMn4T0Evqr+gwlTq5xPnAlf1K96hen13W24mled9gFmao
	Veq0wy8C4F4sblPSxJ1f6ubSd+o18vD7Uxd3RapQEPWAUIQGVDjM1fjZAMqIBT0kt+ETBXhkX7O
	YuhbGZ69Gznd3FlsOlJbrZq8zBlJG/6+F/tPHsJlt+YCy3+TI0/iP0THS
X-Received: by 2002:a05:622a:4d86:b0:509:39b5:a977 with SMTP id d75a77b69052e-517ee225ff3mr19651141cf.5.1781170849384;
        Thu, 11 Jun 2026 02:40:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4d86:b0:509:39b5:a977 with SMTP id d75a77b69052e-517ee225ff3mr19650901cf.5.1781170848859;
        Thu, 11 Jun 2026 02:40:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f1478csm41082666b.8.2026.06.11.02.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:40:47 -0700 (PDT)
Message-ID: <b86e9f5f-a7ec-489e-829e-6e07c62841a3@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:40:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: n9-G6VaG3hY5DmWTBRGYt1k2zbFM0D0I
X-Proofpoint-GUID: n9-G6VaG3hY5DmWTBRGYt1k2zbFM0D0I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfX9w/sgOgpFCUZ
 l0q9NumiZll78Z11dqHgCWqdg0Za430tpQHvIm2Ecefd4k4pJBbh2UK+kCtSvdvaacr24f8q5l1
 D6kFPb24mNhHqc8rUp1SzFwuHB5JA2M4W5EBwvWsjceVJC46gFSUdbLGS4dLl1UGN5nWVQXQY8d
 Ywy2U0x4iXtcXNuDvjzEZ+oxiO+2jYCyfYdbNGwLZyD7dnwAOgvxJbTo1xqVRQIB6U1TV2Rv7BU
 1o0DOflCnpDiUTZGMQx6kg6ZQuMTqt/e4NyGLcDCBkt/KZUoR3ZWA46sB/i+HxsrNl+YqbTACME
 YfENEB5EI+mC6opHmD4/3gH0hwf7ZU7YmwsHiAELygw/z9/6+igqTxVdshT6fNqlLW32087Dr0f
 axMkrq1agJX6jtdzo34AU5dNg18wjDNGjeGyXukXFCQB4PHpd+9gISYOulJHgpTK3uT3u7ZVHKD
 UvoKMU5UBgc6gEY8S8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfX4xqfkmsRI6t8
 x7JzUQ9kB7QhIR45T/SjXYYPqaoZRrl4kk26MK9y+5sojSsQu5FqF/5w6L/P0fYKhUdVRCTmrir
 rg28My7FxwTCfdcDZm1FW3P7qrcmc14=
X-Authority-Analysis: v=2.4 cv=Lf0MLDfi c=1 sm=1 tr=0 ts=6a2a82a2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NxhCX_73iKeGXg_BdwEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112686-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,redhat.com];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 662CD670843

On 6/8/26 2:21 PM, Imran Shaik wrote:
> Add support for missing RF_CLK1/RF_CLK2 clocks on Qualcomm Agatti (QCM2290)
> SoC.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 103db984a40b950bd33fba668a292be46af6326e..0b624ed4715c75042b92ec49c073b281533cace4 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -495,6 +495,7 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk2, 5, 19200000);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(rf_clk3, 6, 19200000);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(ln_bb_clk, 8, 19200000);
>  
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk2, 5, 38400000);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk3, 6, 38400000);
>  
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_d0, 1, 19200000);
> @@ -1262,6 +1263,10 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>  	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
>  	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
>  	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
> +	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
> +	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,

Is RF_CLK1 19.2 MHz (with the other RFCLKs being 38.4) on purpose?

Konrad

