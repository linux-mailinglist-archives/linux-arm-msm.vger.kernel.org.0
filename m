Return-Path: <linux-arm-msm+bounces-104074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DekJAap6GnEOQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:55:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E28044500F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 12:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E209300845D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD683CD8D6;
	Wed, 22 Apr 2026 10:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f25Tlirp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qf18nqWl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F073ACEE0
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855282; cv=none; b=pUUaBo+JnUAgY/nerRSJsnDCM5g5ulMotj+e8OtG1Ocbvlx6Bti37NLTLUK209RbY9AN38ojjVDyAXB7Pd9BHERg+H9ThwuDgn4Vujs2acNWq+hwICo5pXlEAPwbhGnzXLy2Wluv9Qf6j4295NK2D32j5reJMbZz3ygXllVwqW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855282; c=relaxed/simple;
	bh=s7qqKXP5rsxtgWlSlo0b3SQeHvEWj675RuctlxGMm/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hB3sWKi88eketjhVFkKNmY/LCuLbnxZgAZjHgmX0y29lV6Y6zjFYp53nqrpJQG/XcNyamIsBSrxtZeAxiajIsSQnzrShNlUNXufuZyP8Ra705PNahwrsiTZ+q5IXJzypTXLwMfTZSCRlyhUQqXCHqSg8G309J8lI7+0oPHR7QRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f25Tlirp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qf18nqWl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MALXdj976182
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPrSphMryBJEES6iy3//yAergccADe6wIWq8Ir+NbZ4=; b=f25TlirpVj0F7dHd
	o3nSXN6GNLK6tUshzRYVbhR+nLs+sIdz+3f5XgEDNLWEpCUF8VR44Nck6DHm1P7a
	QL209UdT6kc8fgjegBbBgCycMjdsTpPdeGtRw8vbVJ8ofKRrXDlNbVLGAI124x+Y
	H504AdzNnQqReHDhwnm5S01ER+WL47umiOTBAl71X+R1B8+9aR4fBhFzWgG1J8Dg
	SpfJihxQJt2mar0qK9EUEiSItl7YzwIxYmFDU66cCkIvdUucViSTRHvLN6cU4rXI
	B0FzmgD/iORmbVw1uGPuNPZP/v0Vr4M6fbPLAh6Gnjq24yXdm3QVva3n1sK1hfSd
	ayJ5UA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeneb43f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 10:54:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8edcc885cd3so62599985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 03:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776855279; x=1777460079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TPrSphMryBJEES6iy3//yAergccADe6wIWq8Ir+NbZ4=;
        b=Qf18nqWlMysX0O0sbaFyymQuCm0DaDFkH3U+6XKX+BTd8Fos0qQbNVHiOOluy5mZKj
         Qg+nVNvhQ64ZrDZErP2yrahHYM6er8XQoD/qb4rsoXMvSe7ldiWwizpULiFinOSxEAXR
         0Q8Y3Yizs8OHV+IB+ieop2aT0xVZo8JzrfUHRw6fqBDs2ogPBYf57qAmygbYRfTU/orZ
         SGevn/+tsFzychCozuzf1YnVpl1wLS4pdBg3xcNrPsY61qSN8VbJ/LuTQD0qwqClcyTd
         GWMb6B2j+e/v6hECxNUE0UzrOWyl+V51GksQ6pR7NF7z0uspadmZn+p+bHotpHfYtmai
         e79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776855279; x=1777460079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPrSphMryBJEES6iy3//yAergccADe6wIWq8Ir+NbZ4=;
        b=RgMy2EXrXgbmvjulmaCMKGfnsbnHuCf3K4cNQHElctmrh4Qj2d2JAO4jxOZNJc6ylQ
         XuqZ9hZjtxr1Zzziz7aaThCeF0RMu0L41QXqSBkk/sDMIsH5fS/CRrNz2fO36fjUDImw
         FGTn87fN/QE0jKO+TNkA+H5j5RK9wZq8ISHu5J96gGiCygg3r8rBIMiiyxEKq1TUzRKd
         cg2gsGXJqAPOeHAx/B8VzF5pVgIH1MtN6ijN9sNwroD49UjA3aNqTfdnl1hLPmrCdfW6
         wdzmnC/+kIw8Z/LIHd8uO8Cg4izJCVAMscKgtsPr2pktjwW7QSZJwrQpd2Kh2H2H3U+S
         KTXA==
X-Gm-Message-State: AOJu0YyO//q1IJuP5rWKQb1KGqeOHNHa9FcDVzY3Y7jflrvd62GgwI/5
	yq55SkoJ7mTm8ssKj2QzgeVouuuA9r92WchP4l3mJZe0FX1+QyUHKXkzR6ia/Hq8W9vkfTfYKcJ
	RkuQYCeyoQQEMqdGOGetO2pWzfSqr0kYB3qkCcMIpXJIwS4mX269u8sxqe1/nuT9ENrob
X-Gm-Gg: AeBDieslyWFXl3xerEnJbmNnRIBV/iH25IHLEN3SooMvycH3jFHC0MR+yZk3ByYCv3Z
	m7OQ5LcBLGx2qcJMqrowguh13uDVUHHjdR0TO1nn9vsR3pUkFXrMc6TqBNjPBItiiVcPxJ8OyJv
	vAXrBEvQ/0m6PPwMeAKCUnuFoMiFd2W+FLVA00JBZbPF/xzSlczbx+L0u1YfjTIi5b94ELsjbRR
	fTyiR0jLU1FTJWS95NEBwpk9zRdUnZF7fSKgLBTYwVRpiuDa/H1anJCst10fQ8JJeEu4LOFDLLr
	pzDcXLU5nvey5XVvLUuXe4AiqEFrHucOrJ3EZfYilMlb2eKA8mSfgiCBnoLLuQXhR5d4cJFd8sc
	5yVr+O+jYBG5C6No9KKj5FCeccqLK1FNJ84LDhTmC0YZCftsdlTXM/Wix+kmE/eSc0VCYbc9FP+
	Ql7wk70U9UXrxSpg==
X-Received: by 2002:a05:620a:2a13:b0:8ee:7878:af34 with SMTP id af79cd13be357-8ee7878b19bmr574680285a.1.1776855278892;
        Wed, 22 Apr 2026 03:54:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2a13:b0:8ee:7878:af34 with SMTP id af79cd13be357-8ee7878b19bmr574679285a.1.1776855278461;
        Wed, 22 Apr 2026 03:54:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d4561fsm3301028a12.16.2026.04.22.03.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 03:54:36 -0700 (PDT)
Message-ID: <e2095ff8-5d90-4b09-ab09-287822f844d1@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 12:54:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
 <20260420-read-rpmh-v3-v4-3-70c152e6c958@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260420-read-rpmh-v3-v4-3-70c152e6c958@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwNCBTYWx0ZWRfX4q3ru02R8i8W
 q7GRQEcSLoipjZJpynznCl+1moyjA2UzEpwV3ODdmZDmbuF3Z036nc+BdCQcOmGJuKHcvSUhJOZ
 ZUr9jnDCy+Mo89o871+myJO+++dmzlA9GmGaHn/7sTJ/uBHXk2cCsmVIwwi+NLPvBwNar25pwlr
 tx9Z8D28WTIGCLrINKa4yIYJr7d4ZSL+zbSzkBOZhxMhNNGnyBy6GOnIMoALvGPa3lKD8LCbHph
 zqAAfD2sCXsdbPRu4BNnod1jEQhUYIjSrxj0i+bZl4eqP+3DEN+qcEhLtt5/FGfpDd128cyvh7p
 9kynnx1QTxTXl/K3oBEWX/pZIDI1KlF+o36CP0STHa55zjcEjNgls4oL0oB1ZTjbQzhEm4Ggdng
 2WQ4lvhrOaQ7BL7dfckWjVJHjwA6fe/oDnX74YaZAiHlhc+gpoLEBfoKVAH+xTzqhysBB/bxJq/
 LAbnKkkvLO4yWrqgmyg==
X-Proofpoint-GUID: qBXo9IjMgemEL2q0CxfpgkwbV1yK44Zd
X-Proofpoint-ORIG-GUID: qBXo9IjMgemEL2q0CxfpgkwbV1yK44Zd
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e8a8ef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZIThRnkgJp5XSj0HyFcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220104
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-104074-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E28044500F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/20/26 5:43 PM, Kamal Wadhwa wrote:
> Currently, during regulator registration, regulator framework sends an
> unnecessary `min-microvolts` request for the rpmh-regulator device. This
> happens because in current design, we do not have a way to readback the
> voltage settings that was set during the bootloader stage.
> 
> Fix this by using the rpmh_read() API to read the regulator voltage
> settings done during boot and make it available to regulator framework
> from the very first read after the bootup.
> 
> Also use this API to read the status/mode/bypass settings as well. This
> will provide the regulator framework a sense of the initial settings
> done by bootloader and thus preventing any redundents writes for any
> setting post bootup incase the same setting was already applied during
> bootup.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 179 ++++++++++++++++++++++++++++++++
>  1 file changed, 179 insertions(+)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 85fbf10f74bb3393071bc65681356312f27b7527..1add15d73cac67ad8c0b45aaad6fb2ae9b388180 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -14,6 +14,7 @@
>  #include <linux/regulator/driver.h>
>  #include <linux/regulator/machine.h>
>  #include <linux/regulator/of_regulator.h>
> +#include <linux/bits.h>

Please sort the includes

[...]

> +/**
> + * rpmh_regulator_read_data() - read data from RPMh
> + * @vreg:		Pointer to the RPMh regulator
> + * @cmd:		Pointer to the RPMh command struct to readback data
> + *
> + * Return: 0 on success, or a negative error number on failure
> + */
> +static int rpmh_regulator_read_data(struct rpmh_vreg *vreg, struct tcs_cmd *cmd)
> +{
> +	return rpmh_read(vreg->dev, cmd);
> +}

Since this is a wrapper of a oneliner, perhaps let's just
ctrl-x + ctrl-v it into the usage

[...]

> +static int rpmh_regulator_determine_initial_status(struct rpmh_vreg *vreg)
> +{
> +	struct tcs_cmd cmd = {
> +		.addr = vreg->addr + RPMH_REGULATOR_REG_ENABLE,
> +	};
> +	int ret, pmic_mode, mode;
> +	int sts = 0;

Drop the initialization, it's always initialized before usage

[...]

> +	/*
> +	 * NOTE: Since BOB4 BYPASS_MODE value = 0 we cannot confirm if that BOB
> +	 * regulator has been sent into bypass mode by bootloader or if bootloader
> +	 * just has not requested for any mode voting. Due this limitation, we
> +	 * must check if the read pmic_mode value is non-zero before comparing it
> +	 * to bypass mode value. This also is needed to avoid setting BYPASS status
> +	 * for LDOs which dont support bypass mode, and have the pmic_bypass_mode
> +	 * uninitialized value as zero in the vreg hw data. For such cases assume
> +	 * lowest mode/status, if pmic_mode is zero, to allow for mode voting.
> +	 */
> +	if (!pmic_mode) {
> +		for (mode = REGULATOR_MODE_STANDBY; mode > REGULATOR_MODE_INVALID; mode >>= 1) {
> +			if (vreg->hw_data->pmic_mode_map[mode] >= 0) {
> +				vreg->mode = mode;
> +				break;
> +			}
> +		}
> +
> +		vreg->status = regulator_mode_to_status(vreg->mode);
> +		return 0;

nit: since you did so above, please keep a \n above the return statements

Konrad

