Return-Path: <linux-arm-msm+bounces-102142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BNjG7Tn1GmeygcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:17:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 786883AD937
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 13:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A79A1301370E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 11:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C08C31283A;
	Tue,  7 Apr 2026 11:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cbMHfROR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A4a8f4gv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4DF3AE180
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 11:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775560609; cv=none; b=nG284OkIFQJaNbuibu9N6VP5vujSGWATlOFCODbvYNMzzdYAapzoOaHk+QjhU6xGVDStyFOilpr8prO8I2kHlMelsWczA1nFEeKMSRbikqJXBrPOhDGR5TfEL004/5L1o0ecGzkEy8PPxrktu76o7EBStdVujoe8s90Yatzjyo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775560609; c=relaxed/simple;
	bh=XjZYpik5TBL7Me6+hcGALpv7NCK0LGyqwdGNHkUEAcY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H8Rvp1Ib0ofriR3phD2i8qPCWPfsftPvHH4FDLOiUjnUjxIBWEUzOfLBw1BXC4sFjUx56BGc38ntyuA3ssZii6KzFfJvysHIqfMEo3ppbYdvX2YjZHAgKfe7FQ3rzLe75/Epj5GtkPhYD4S3D5JtI1vAydX5kVgVYWoLrBe/2K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbMHfROR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A4a8f4gv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376ZLJX1584355
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 11:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0tMT9R83/dTxVTP1U1Cfj0fbDe2K8UZpLCbh3euH73w=; b=cbMHfRORdhy8+Lr5
	WsFuwSuq7nSg6fhLoguE4mf4HSqjGtC/TxNn+JIMgZfgEbNPdbUg8QvcCjtyEK3r
	wb+8oEPdTyPdgYOXALJIZa6skgS0/kdi6tamz9KX8vKsGLOWOJru4y6DF4FSyIQP
	bvkQ+fMbHJTYL6Tmepc2PPUBNPm0/Fy7FV1hMo3Yj5/P+ss0+a6mOvxaAevno/+l
	BtJ3QpQL5IXtAUuiV0GKnbscT5ltpwgxlNtn1HmR5VtSFcAPt/C81YA3Cv/mN/dZ
	xbppOTg8Hev9lYFrHv9TZhcapN3fVM0QqZT3q2g8i57EJKO1QPc7yno8RGgEZvm0
	Xu/Y0Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9teva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 11:16:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d87632952so7546921cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775560606; x=1776165406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0tMT9R83/dTxVTP1U1Cfj0fbDe2K8UZpLCbh3euH73w=;
        b=A4a8f4gvOY4+fDxHBJxP2+fbGPAdYK5SYVijHrN0jNr2X3n+IhkNrK6f2bJjmH1/Mx
         m7j7w9sBNO93QtcqadQNuzl2AHaGu54JsZDpdF8WWFXeSxFBxCpmjT1TNu1XHpAqZHMq
         /qg15Wgr4u8gMWI7QbvzsHHMcpzYwGS9Mjk4aF+AATTJMYnLAcJViIV15+pdjkbA7kMo
         1BaoMpj5qXpl4YlWBSPHKZoFDyh77vrg9Tvl1u4OiVCXFTYXY4W/7sZTcimUn06EK6YW
         AJWio56pqfmbfEa6TIjjWtaM/aezd4yMiRrBs1CkjI7EdV/MNlwwRGlmdU5ohHG09ROl
         OmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775560606; x=1776165406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tMT9R83/dTxVTP1U1Cfj0fbDe2K8UZpLCbh3euH73w=;
        b=XNso+LDv6Av3YEd2Fxyava2az4d+aHjNgzXT5pPndftXVpUOgfDNxSaiULJEFqHjF/
         e8zukzhHuiEp7duvkSrmprHJptItCiFKWsf5HQJaFJd75BOWhH0jPST1iXyTqxmRc6CA
         +sYMjK4U/S78MtResguprH6ZemxpNel1atFwE2qaalR/LE1+BjUZ3C2fGPIkwYSgEhX5
         9rxlSoiN0TKiw54y2fZd3rjF1lcN+joulq0p4qztN784ifzvddaV/JRbs5f6VCOJD7tT
         qoR9vWJhE5x7aomXE483Vu4+9G791/cSrPbCQt28Yt20kpzRf2A69l04ACwVgHXmez0D
         66mg==
X-Gm-Message-State: AOJu0YxF+2KkXjBCpoayGxgVXuoJfOKWzev7mrwaj8bHav3lJ/ZGD4mc
	0rVnSNDMweLqCWrzzRgEX3KdpygPVs0/tA4E64E21ryYi2e7kmO1Xdqu46gnEx/4NCFaSiPIicD
	Dl5LigpPoAj+DnAKYQmMKV8T3yUMjYtMVgvmLt5OJEaL/0IXt2maVagWHOq6nht8SPt2+X/E6Vh
	Lp
X-Gm-Gg: AeBDieugpjL7dMvS8WLcuQcy9Vw9ILzV7DQFw0Aav/9KUqlvp1X91ZcOfmc9K3dNVla
	5iP9HDseI+V3uFoJ41PvrI3u6bzVYP/NxFpjhiBZ5f/sA2ry1ow7IC223Yhoy9uu13whKlFQ5Q/
	b2AFhK0k0qWIKjJzhfKZRPYYVNqXpWQKRfh/dz8yApgeO+ZiEmcDEoGAfucWDz2P0KJ1eQy2+bo
	MfcdEEHDT17IcrkiNTk3PUhE363svHJFKrueGRU9CZMmFBhHHJHRbwLkm4fhbtgKHzLbB0wA/vs
	QPpP9zsr7P9XhHh79IdnouZRmEvW1AKP7qgoQckwXVlbRBDzNznL+IQiJK9wonBpHJ0xN+2W1hF
	27WlZNvIRBL1IUJAowkH6i/zPHKo7ql/nuvlpJh2N5lZOmhxhFwP3gxZajdXPoPEzYIo+f5YY/Z
	20Zng=
X-Received: by 2002:a05:6214:212b:b0:89c:ed34:5653 with SMTP id 6a1803df08f44-8a7048cc933mr194842896d6.7.1775560605842;
        Tue, 07 Apr 2026 04:16:45 -0700 (PDT)
X-Received: by 2002:a05:6214:212b:b0:89c:ed34:5653 with SMTP id 6a1803df08f44-8a7048cc933mr194842466d6.7.1775560605293;
        Tue, 07 Apr 2026 04:16:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd21088b7sm36950111fa.22.2026.04.07.04.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:16:43 -0700 (PDT)
Message-ID: <01f9d2d5-5480-4470-b593-eaf2f3908cfa@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:16:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-read-rpmh-v3-v3-0-34079f92691c@oss.qualcomm.com>
 <20260407-read-rpmh-v3-v3-3-34079f92691c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-read-rpmh-v3-v3-3-34079f92691c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d4e79f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vQJJOj74BLs4DwR8iPoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNSBTYWx0ZWRfX5oAIgGZQVkPI
 Yh9c+VV8u4sxcyp3bVlxPr3HK9i+1PJmouThd/um6xKWZZF5332baAb4Udvg2bneCc/MsjU3qy6
 XMGWLmyeOR4laHOtXFmk58yfaYqu4V0y3JVDGH/BBFJY5B4Fpre+aBTIepZeT51pJD7WbW5vbop
 qpALDA+WNpBF1SbMB2zPBzEhm2KnXq53MosBIDJMU2Uj5spI8agP4vWRti6R6keRG+HIHB56tgI
 E1vARJK9RAVDzQ9NcGR8st4xFxrp/Wca3jOtE7xibdPiZZ/npaOC7OrETuwsQXjtrvPGoXfU7M+
 e0cxxJCGU0BmQj/xHjDQMOz9Re3WHsjGzNADJ2ZQ2cNtJO0yfWp2xXG70Tb6mcnGapbqdmnU61y
 y2eNLMh73A2pTPSRrgAkJc3VyHN5LyUFmCB5wK1fWB7KRKTifjrrLdZszOqQwod8UIhGoDCeCC/
 4mMQHHw0x6vb5fWjxGg==
X-Proofpoint-GUID: -mlraKyyfQBSi4M-KsuIAal0_HBn538G
X-Proofpoint-ORIG-GUID: -mlraKyyfQBSi4M-KsuIAal0_HBn538G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070105
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102142-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,cmd.data:url];
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
X-Rspamd-Queue-Id: 786883AD937
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 6:43 AM, Kamal Wadhwa wrote:
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
>  drivers/regulator/qcom-rpmh-regulator.c | 178 ++++++++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)
> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 85fbf10f74bb3393071bc65681356312f27b7527..8e1c576b718b595bbbff7f5fa76de84d4e90f3bb 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -61,8 +61,13 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
>  };
>  
>  #define RPMH_REGULATOR_REG_VRM_VOLTAGE		0x0
> +#define RPMH_REGULATOR_VOLTAGE_MASK		0x1FFF

GENMASK(12, 0)

> +
>  #define RPMH_REGULATOR_REG_ENABLE		0x4
> +#define RPMH_REGULATOR_ENABLE_MASK		0x1

BIT(0)

> +
>  #define RPMH_REGULATOR_REG_VRM_MODE		0x8
> +#define RPMH_REGULATOR_MODE_MASK		0x7

GENMASK(2, 0)

[...]

>  static int rpmh_regulator_vrm_get_voltage_sel(struct regulator_dev *rdev)
>  {
>  	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
> +	int ret, uV = 0;
> +
> +	if (vreg->voltage_selector < 0) {

This assumes that the voltage selector can't change due to an
intervention from say ADSP - is that true, as far as the _read() lets
us know?

But I suppose we can't know about __every__ change since they could
happen without a notification to HLOS and it's probably much saner to
stick to what Linux believes is set on the hw..

[...]

> +	sts = cmd.data & RPMH_REGULATOR_ENABLE_MASK;
> +	if (!sts) {
> +		vreg->status = REGULATOR_STATUS_OFF;
> +
> +		return 0;
> +	}
> +
> +	if (vreg->hw_data->regulator_type == XOB) {
> +		vreg->status = sts ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;

The 'else' case is unreachable, since you return early if !sts beforehand


Otherwise LGTM

Konrad

