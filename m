Return-Path: <linux-arm-msm+bounces-91826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBtrMcd3g2mFmwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:45:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D515EA6E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 17:45:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EE87300D467
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 16:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAAE0318B8F;
	Wed,  4 Feb 2026 16:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="In0EgCdD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeIYtcTA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1698A318144
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770223316; cv=none; b=DGa2KjNb7Rf0sUb2cvd8Tu1BWn11V5sxcJUsl4+0zTTjMfapM1WV9Pu3CT8lS/ZOOXyNZthOYZP+vXj+wgHvzksMWnporBwAiEFKsWL0bD/Ja7ZiW3FiaO8M+bpluGheenFkLhk7zfH6wsfb0ZqHM5qcMA9FfrEhhyrg++7dg/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770223316; c=relaxed/simple;
	bh=acltMfFzPryyJq9qI9VcgQBaYlyC8ZuSebWFzC5CLlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlnOQOwicDaPp+DXUk+QA+m5+a+lkM8HMp/Bl+diiuNi/S773d/EJZVsmQq1g+SNRSqKsv44jWqxHdIWjX8id9yM1IIJ5AeABcRZDd8cDVOY1bhgZipAuWbhu24JqXHVrquBMCuBET8uSwT8w/xKF6gdz2kFd5a5mOw4JkzHXmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=In0EgCdD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeIYtcTA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CILva1393875
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 16:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xy1P3uXgNOlvPZcotzDc6j0P5vBv6F9/PLCO+QEz1fI=; b=In0EgCdDHjkmwQXr
	B9KfmjveLsOfGsEf8EgFsxbUt3PghvbYIi54L+t3mIaghKj9AMgeRB2bnWKZuSNc
	rvHMCJu4lezoBM1eWkoF7B4mdNdBnHRU9QmV1wzziWLSV3ssvOr/G17GRqIUom5K
	h5Bs5+nS509zi5y9npGlJQq3YmxCb6/gSg3qd+tovJsNuoTeeii9NUwDw7BYAZ2x
	/RWC3qZoo66GHxdb9ue04Vslz0SUPyKPpQKNyJeBMktj13fvb7frlD3gKMhWo54c
	JW5g/mmqeYl4fRdYkuTvsgeL8+utNFLpK1FWyzTnfusP3lv9+tZWnelZan/zR/jE
	R4b/LQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43dh1a08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 16:41:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ca3952cbb9so28442185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 08:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770223314; x=1770828114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xy1P3uXgNOlvPZcotzDc6j0P5vBv6F9/PLCO+QEz1fI=;
        b=CeIYtcTAvaGQ5aAHyMe9CkhmVSG3iCV8VHoLUI16XuWfSwpGAVlGSJrsLtVQT5c01K
         Hf+sp+Fc4CLEk3J00Y+J2SxDoaW3F7coi+XfjPgOCuth1sBIGNjhG7HBZYctiAsM8jOe
         otyJzy2604hbrCfx+GJo6utnEzHTKj5w8d0FuV+wKbpeQ2bgYzNIOeWjN5VndLTuM3iq
         T5gnuFq3AL4c+/nUx/gBwqfLtMYcAMY9cGTAihcRiEqGB0V1VcP62B5Kri3lG5Tp+Io5
         6uJ6Xj2liDQa1yYy7yEAiIc/+1KIFZ1XERJH+U0Mqjgqk3UG4cENsdf5pyPsWNGwEOOJ
         f7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770223314; x=1770828114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xy1P3uXgNOlvPZcotzDc6j0P5vBv6F9/PLCO+QEz1fI=;
        b=hfGfN9CxqbCTbaGoER8+mB3oexCjtopaecaQqqjOJtvVws6V80oKg1pFXQuAXuATzy
         BYhgltqZvLkmqaGKNnBsfdiZUPmC2dm38KxlvFIArgUjuHBZWyFZi1xkzte8KROu5cRT
         Kj7fw/s7kJMRlVdDbBbVtXLz9z6onrh8oGLyFHTzhcycXJJO3UHv0vRRgcRAGHTc69U8
         4Q4nT+52edBravHdDDOAkDhYCi0y64hbt03WxFFmUl9nk7OfdF3miNZYqV4wivLnVsso
         XnMeBYbOrDj/5kTWY7JL+hvizYlm0vIiqiJkg1pu8e2A0mV4FsbZ2bfIayFj2VtBUtLe
         w0EA==
X-Forwarded-Encrypted: i=1; AJvYcCXghQRoTsIUtIwdcPvwJmdkEGmYmPNJKvfg93la2ZRPk9lv51zKBBzOK+wxpR/Kdy1FuvnQg5FJ2zUIoNWa@vger.kernel.org
X-Gm-Message-State: AOJu0YxhiNCT8vu+3ID4llshq3DsNILLs+Sr1Gqk9jnNUUIYULDQv9Tt
	1wyBZ8PBxe+gWRYoT3ShMO6jv3abhxJDcSglsvflnTaiDsN2ceT3XYCiO04cxii+DgzlTljmnGm
	GZ/hs2YOic4ON5DtYl2ck026e2pcCKmgynVAzROXuHny6//z9B/97wqUGaK2aVxyRXzl5
X-Gm-Gg: AZuq6aLq995QuX30gUzbSim5K2bWIH9lu18wlO9J9+LY4ZODyDs6YNLwuL1CwujLPJf
	ZlKKRqJ6tg4lWj7+J14IlkdVcXaOsR8qClWhAVXaMDDf3lkAfZ6qTjZuAEtyN3D5CZaYGVR+Wu4
	ZL0MCFp5I4K56BIzEVFL3Ki/uxLIqzK3GhyxPmAfmFb7ax9f+Qd1d8ylgMVRpCjNDQxBG7mZIW9
	CwReW/gJujPRrHYDPrlblbGCC0y8FEDokAABZ2l9Z/XI8FeIy7MPVEi4dCZe1ALdCEHPiuM7wtE
	yHILxIMboSABA0UfYGSSiCzKuLEkSTYU2TIIcNthMVlRikTZlP4Q6D69A0G93CpVPdIVx1GznsM
	+jdoGkJZUb23OzFmA2xIQmvUIiYaWyMUULPnSJxkezufd0RKJSxBXatmYyIMEXPDt9Ds=
X-Received: by 2002:a05:620a:1aa5:b0:8c5:3892:a554 with SMTP id af79cd13be357-8ca2f83ce18mr346470085a.3.1770223313919;
        Wed, 04 Feb 2026 08:41:53 -0800 (PST)
X-Received: by 2002:a05:620a:1aa5:b0:8c5:3892:a554 with SMTP id af79cd13be357-8ca2f83ce18mr346467385a.3.1770223313416;
        Wed, 04 Feb 2026 08:41:53 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fd10f2asm138204266b.23.2026.02.04.08.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 08:41:49 -0800 (PST)
Message-ID: <68908c06-390e-4717-bab2-708de7f5cec4@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 17:41:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] spi: geni-qcom: Add target abort support
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
 <20260204162854.1206323-5-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260204162854.1206323-5-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bMgb4f+Z c=1 sm=1 tr=0 ts=698376d2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KiRDxWFFE5j6wAypeYgA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: NqgHlDGLpqTsJxBeEUIMZjxIDI7bOzkr
X-Proofpoint-GUID: NqgHlDGLpqTsJxBeEUIMZjxIDI7bOzkr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyNiBTYWx0ZWRfXyulNAGvnZCCb
 +6Xf4bTPOpH7czjuzFptElHCGTtacyNt+WVqwI2AeIoo1FFMDRRhD1XJlKJh8gRVBS7crQgY5AR
 Ox3TrU6JaFxck1N+tTFuBRKSiYiLmwIgmKssfJqqqZktP8JcyL61vs1a5Z6Ziu04vYirSCLjC64
 qpnYIq3Bzt5LJueRsBoh8i4gNfCu9+ZArkyutvIJb9Bd0U/cD/hoPs9H8rfboLbXYCxOM9IFang
 baAyQ99ua4VEBfBVyd5+REVplTt69QMjZOtgJ+7p9fx3tIJl81ixOu2WPEVDWd06TZzADgg01mT
 Bf7N5/YzXPsOZ/Lpn6wGP8lATsvi2bArmbYDJ4KsSw9YHkdbyJNZt8dy42pKFjvHlNbtN6z8Z8Z
 3aXdJKUWY6Gr0txYy64r2VlM0E0w2jTXoxTVmgwnCpX3J7tEmFLFgMxEqRDFvNyhjOjrcROpJ1P
 ZeA7le4Txz/oTaTLgYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-91826-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2D515EA6E0
X-Rspamd-Action: no action

On 2/4/26 5:28 PM, Praveen Talari wrote:
> SPI target mode currently lacks a mechanism to gracefully abort ongoing
> transfers when the client or core needs to cancel active transactions.
> 
> Implement spi_geni_target_abort() to handle aborting SPI target
> operations when the client and core want to cancel ongoing transfers.
> This provides a mechanism for graceful termination of active SPI
> transactions in target mode.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---


> v1->v2
> - Removed unused param from time out handlers.
> ---
>  drivers/spi/spi-geni-qcom.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 5077dc041e3a..43ce47f2454c 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -1003,6 +1003,17 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static int spi_geni_target_abort(struct spi_controller *spi)
> +{
> +	if (!spi->cur_msg)
> +		return 0;
> +
> +	handle_se_timeout(spi);
> +	spi_finalize_current_transfer(spi);
> +
> +	return 0;
> +}
> +
>  static int spi_geni_probe(struct platform_device *pdev)
>  {
>  	int ret, irq;
> @@ -1076,6 +1087,9 @@ static int spi_geni_probe(struct platform_device *pdev)
>  	init_completion(&mas->rx_reset_done);
>  	spin_lock_init(&mas->lock);
>  
> +	if (spi->target)
> +		spi->target_abort = spi_geni_target_abort;

The same check is made in core:

spi_target_abort()
-> spi_controller_is_target()

So I'm assuming the intention was to allow assigning the func pointer
indiscriminately. Other drivers seem to do it both ways.

Mark, any specific preference?

Konrad

