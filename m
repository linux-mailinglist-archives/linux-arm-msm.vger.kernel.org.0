Return-Path: <linux-arm-msm+bounces-106781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LECC7Bn/2my6AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 18:58:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF8C500978
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 18:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFBE0300F19D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2026 16:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B8439C013;
	Sat,  9 May 2026 16:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGwKaC+2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DjCRj4LW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A88396B6F
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 May 2026 16:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778345895; cv=none; b=nKhl5mryrmgFytZxUXxzfhSVBLdVx766YkgqDKc2mh8wey1KH2G5OdvwNVIXqzhjnp78MZhj0n+49xaaHzwR5kpdVL8jMY/wFEFazicS0Ih3dp5WLBx8dhr1c1vch+zxjgbqOF/iGOH7BG8AsrYEgWEeg0jnNRWPpaC906yZS7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778345895; c=relaxed/simple;
	bh=WNTc0OGO2a4taecvbw4qU+LYVnU1uXeaDf9Wyp0bAOE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ry2H52CIfgKro/48nlEHP6U7hmOYEW2R6Gkqh6pgLYQ1oCd+NUnyxT3lppEk4tng9H1U9pqSeL8XPoWjCYSqYzBXe3q2VD/Q1JrTAi0F2ncVIO8CjBa1l3WeF0v/XF35qwKS03C4h32GC81nk/EsV/rqeiVxAAh/B5Q1OOEaU7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGwKaC+2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DjCRj4LW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6493PcDx2089317
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 May 2026 16:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aG81+2i+7FJNAObHDDs20lBo/zkXJ9T+aw/fqgDq/mE=; b=GGwKaC+2k6E2YZ7J
	dtwr1lKS/PsHv+vQ7zpR4RDncYap1jlbTL50665hbiCqZa6LOTAU874d2yCAxRbv
	aSdWaqS+0GL4DihkQ/Uevpa4kpaehth/jG/LIUroyNfqjwvLQvBMYx6abr9PHeY/
	ZpEJJ+yZBvtyNDBoVRCK3NENvSPyYforSwWYwli7+6oUnMn+GSy0BWYb53ly+5Co
	VSK3o1NB0i0yISa/klcRo/Wzz6p9VRzwh6JLQAonXjGN9Bn3We87ss+OvDh5F9AV
	Hy+41KrfSocn4D3r9A+Gana0OBgJanSL8L4ND8wXO6YEVKt4KNqoWYKmfCmg+9Hc
	wrAP6w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1w0uhb5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2026 16:58:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367c2d149efso1028626a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2026 09:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778345890; x=1778950690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aG81+2i+7FJNAObHDDs20lBo/zkXJ9T+aw/fqgDq/mE=;
        b=DjCRj4LW5npJeFk9nzdUUK1pwogvIaERNaIFOcbaBKC+K9sdYq8o0gyROtT4wk51Zf
         oGBXYHkFvI3JJNNjK9FABDsB0s9UGHbTk9tfYlEXkGcxwdq4CbCO+8eUuHI5NKamiGJy
         IGhgNWfTgaFnX75GYPbz8tObjLe5Dr2Y3qlVztEpTARGRKD9HXuOApmP3jzk8B6sUozK
         MC9ffdazICDXC3a2JW6WrPrvdel1ipqkdI5hJj/W4txv55AGUQlJsROAzA8N3SdBfk+n
         Zu7MI+TreGWXPyG+jnI4sypNEFPXMwXN6JzymQHAurW75dfVIbTnsK0JzAQDZ4tVmth3
         duuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778345890; x=1778950690;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aG81+2i+7FJNAObHDDs20lBo/zkXJ9T+aw/fqgDq/mE=;
        b=gN/vN34NLFpI7Xwif+JO60xLSPGtGtceO6Ail2/OaJcwGZGBdDXBfO7cINFk15DU+4
         Oza+8WlZACAFZziY7LOHxJ1fieT8wZejll7MLqLVtvb47fVrEpoMflDoRzysHyGYFl9l
         e3RNrCRD4HT8S34rCq4ktyqsLftU6ihEsudcOwkhyH5fNt58R82xobDSToQXb7brss4b
         AFw6A75XqEzz8mwyt4dv2B8cVYfOW2kztsS+i2vIejhTpupoF79z4v0bFAcWWV1+Sfei
         vrS+0YT5wMWPYnVZzJnxQImsFSF6d5Icg6qjotoakNaXXgxIJ+qx5aAIVx/Xg0Vs20Q0
         f4WA==
X-Forwarded-Encrypted: i=1; AFNElJ/eZs+RQsZJ+N2l8fFlyGkbNFyFXGmzQ4aBBt0bR6yirPAuvHwboEyOk7+yd16AWmfEz1/kRwf8oVOt+5yw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7upX0saUalfquFf0fXSYPAt0LDdlJrcdewiCK2vjipCmPxvn4
	Mhv65qpZxonmDpNsZb429jPMRCvJnyffiY5AG1LRasLyFkRUdN98qZ/fy0oW2fXGR4CbaeWcdpT
	jAQF4Nn6pvsJPwIUUfxa3XMBe6UtQcPOqeRh/PY8rZ2HxxiKkklbkvriXHqvxoPUq//HA
X-Gm-Gg: Acq92OFwSZ+B2MiqYnqte1p02ppasIfua+crPLWYOUuyFxQcjjQ0xNMoNa34+Lu15E7
	k4sf5Bg9magxatEj0eGhfCMKJ/seiV6+deaaTNaYH0/YVVvkJ6tGw6Hii01H//bbUzrIRdcYh5C
	U7P1VzagVi7DcioULARuhNHwvt2BiJPv2h6fXHcU9mk6DC2t5acNOcnunsG0QrwX4hLnUIj0usw
	pZhuDGDvMS5+Fe98hP7V/+/5NxYTa5aNnt8KOB0rI1pNwqFerl71YNOaP673QCBOdpyxGDCgmKb
	j8qTQWg+MC8eskpsbHa+qNGEYXPDqmo/vAi9V8WS+IfEvn49tn5IwcTcqjpXXC1gU5xjH9khL1J
	wQfhukV8n23P9cbtErtjqHfHUfEzdx35MFXErmLdvOA94beZqq2o=
X-Received: by 2002:a17:90b:5603:b0:366:479c:59de with SMTP id 98e67ed59e1d1-366479c5db9mr8171388a91.8.1778345890000;
        Sat, 09 May 2026 09:58:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5603:b0:366:479c:59de with SMTP id 98e67ed59e1d1-366479c5db9mr8171370a91.8.1778345889474;
        Sat, 09 May 2026 09:58:09 -0700 (PDT)
Received: from [192.168.0.9] ([49.205.255.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35632sm58541735ad.53.2026.05.09.09.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 09:58:08 -0700 (PDT)
Message-ID: <34962003-c54c-a64a-2846-8f741fec5802@oss.qualcomm.com>
Date: Sat, 9 May 2026 22:26:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 13/14] arm64: dts: qcom: glymur: Add iris video node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-13-7fbb340c5dbd@oss.qualcomm.com>
 <b36tyrznuwwjiya4lt2ajqbyopnonvubedpofasmzknwjd2mrs@eenc4epvbokm>
Content-Language: en-US
In-Reply-To: <b36tyrznuwwjiya4lt2ajqbyopnonvubedpofasmzknwjd2mrs@eenc4epvbokm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZzajsuO6OUxdYGdhQQdlGcLlUztvYBVM
X-Authority-Analysis: v=2.4 cv=asaCzyZV c=1 sm=1 tr=0 ts=69ff67a3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=SpcZ+gRb+6o1zy8jT5J+bQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tcww-dwagKCKl4DpuMYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ZzajsuO6OUxdYGdhQQdlGcLlUztvYBVM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDE4NCBTYWx0ZWRfX4C6Avxp7qzh3
 0ZO1BTmpirn01an2rj2PzmIMR+0j65yovwwEHrYOAFdlYJo3Fjy51+vb2v+DZnTR1koLckFGaHS
 AczmeOZUtnBGjm5R16MSGR7TnosUYvuSAprWF6pISJeWCAIjuBQ4rNEYrBiTgmrCzysov0MswFB
 PLIXVcalUxvh+NczQDWnQDbcooXELtB8aE4TfwjuI30l2gZ10EtxFw5dD6icFI2waZr+sVJaOi/
 4v9WxcnlbwsyFmvqtp0j4Vtyt+b0w+x7064tcPJINcBd7fk4TGA7CPkOstOB8yXc5PFyDaMmTTQ
 QHiRW2JCDfUrzJUhuaq6gLgPZJICgabkxMKQipoWXfHfx20EkZWz5sixd3gw2sAiK2qf1iQikI+
 IFgEq5LE3yI44vpvDhUPUtgGmrW0bMDQ1siDJrD6hTFaQvtLpx0P1t2dkdR6AABexVLQOs1OQwM
 wUZlXOXjguuzLwXLB+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090184
X-Rspamd-Queue-Id: 8EF8C500978
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106781-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ae00000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,aa00000:email,qualcomm.com:email,qualcomm.com:dkim,a400000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 5/9/2026 12:57 AM, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 12:30:02AM +0530, Vishnu Reddy wrote:
>> Add iris video codec to glymur SoC, which comes with significantly
>> different powering up sequence than previous platforms, thus different
>> clocks and resets.
>>
>> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/glymur.dtsi | 118 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 118 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> index f23cf81ddb77..c47443174f97 100644
>> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
>> @@ -13,6 +13,7 @@
>>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +#include <dt-bindings/media/qcom,glymur-iris.h>
>>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>>  #include <dt-bindings/power/qcom,rpmhpd.h>
>>  #include <dt-bindings/power/qcom-rpmpd.h>
>> @@ -4163,6 +4164,123 @@ usb_mp: usb@a400000 {
>>  			status = "disabled";
>>  		};
>>  
>> +		iris: video-codec@aa00000 {
>> +			compatible = "qcom,glymur-iris";
>> +			reg = <0x0 0xaa00000 0x0 0xf0000>;
>> +
>> +			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0C_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0_CLK>,
>> +				 <&gcc GCC_VIDEO_AXI0C_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
>> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
>> +				 <&gcc GCC_VIDEO_AXI1_CLK>,
>> +				 <&videocc VIDEO_CC_MVS1_CLK>,
>> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
>> +			clock-names = "iface",
>> +				      "core",
>> +				      "vcodec0_core",
>> +				      "iface1",
> I first wrote the comment regarding resets. But the clocks seem to have
> the same pattern. It's not just "iface1" clock. It's the clock for one
> of the cores. And there is another clock for another core. Please make
> that nicely named.

In v1, I used iface_ctrl to reflect the clock purpose, but received the
feedback [1] to align with the iface1 naming convention used on earlier
platforms.

[1] https://lore.kernel.org/all/20260414-lush-reindeer-of-storm-bbe918@quoll/

>> +				      "core_freerun",
>> +				      "vcodec0_core_freerun",
>> +				      "iface2",
>> +				      "vcodec1_core",
>> +				      "vcodec1_core_freerun";
>> +
>> +			dma-coherent;
>> +
>> +			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
>> +					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>> +					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>> +			interconnect-names = "cpu-cfg",
>> +					     "video-mem";
>> +
>> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			iommus = <&apps_smmu 0x1940 0x0>,
>> +				 <&apps_smmu 0x1943 0x0>,
>> +				 <&apps_smmu 0x1944 0x0>,
>> +				 <&apps_smmu 0x19e0 0x0>;
>> +
>> +			iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
>> +
>> +			memory-region = <&video_mem>;
>> +
>> +			operating-points-v2 = <&iris_opp_table>;
>> +
>> +			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
>> +					<&videocc VIDEO_CC_MVS0_GDSC>,
>> +					<&rpmhpd RPMHPD_MXC>,
>> +					<&rpmhpd RPMHPD_MMCX>,
>> +					<&videocc VIDEO_CC_MVS1_GDSC>;
>> +			power-domain-names = "venus",
>> +					     "vcodec0",
>> +					     "mxc",
>> +					     "mmcx",
>> +					     "vcodec1";
>> +
>> +			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
>> +				 <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
>> +				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
>> +				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
>> +				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
>> +				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
>> +			reset-names = "bus0",
>> +				      "bus1",
> The names of the resets suggest that there is single "common" reset and
> then one reset per each core.

Two resets for controller and two resets for each per vcodec core.

>> +				      "core",
>> +				      "vcodec0_core",
>> +				      "bus2",
>> +				      "vcodec1_core";
> Are there two codecs? Or are there two cores? Your naming suggests the
> former case.

Two vcodec cores.

>> +
>> +			/*
>> +			 * IRIS firmware is signed by vendors, only
>> +			 * enable on boards where the proper signed firmware
>> +			 * is available.
>> +			 */
>> +			status = "disabled";
>> +
>> +			iris_opp_table: opp-table {
>> +				compatible = "operating-points-v2";
>> +
>> +				opp-240000000 {
>> +					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
>> +					required-opps = <&rpmhpd_opp_svs>,
>> +							<&rpmhpd_opp_low_svs>;
>> +				};
>> +
>> +				opp-338000000 {
>> +					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
>> +					required-opps = <&rpmhpd_opp_svs>,
>> +							<&rpmhpd_opp_svs>;
>> +				};
>> +
>> +				opp-366000000 {
>> +					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>> +							<&rpmhpd_opp_svs_l1>;
>> +				};
>> +
>> +				opp-444000000 {
>> +					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>> +							<&rpmhpd_opp_nom>;
>> +				};
>> +
>> +				opp-533333334 {
>> +					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
>> +					required-opps = <&rpmhpd_opp_svs_l1>,
>> +							<&rpmhpd_opp_turbo>;
>> +				};
>> +
>> +				opp-655000000 {
>> +					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
>> +					required-opps = <&rpmhpd_opp_nom>,
>> +							<&rpmhpd_opp_turbo_l1>;
>> +				};
>> +			};
>> +		};
>> +
>>  		mdss: display-subsystem@ae00000 {
>>  			compatible = "qcom,glymur-mdss";
>>  			reg = <0x0 0x0ae00000 0x0 0x1000>;
>>
>> -- 
>> 2.34.1
>>

