Return-Path: <linux-arm-msm+bounces-107904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCj0MpAXB2qQrgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:54:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A88854FF9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C68923099B6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF4E47D948;
	Fri, 15 May 2026 12:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XYnol/DH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jDB+mcbm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E6C3AD514
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778847858; cv=none; b=RzmzwrPoaCgcAiHjeMeapED7GiXtEvUfH1dIuh5hVJIOKkKikUrQMFmZbf865NsQzeTcY5VDM9bKU5Cxbdf9z9jF5wae3gEYHBg1tWJ0XvK1y+1AHdmDBRXy6A5RcOpUK6nhLdjymT4d5ASa24ni0/VpZBFxfSLqYjAgVW/xAuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778847858; c=relaxed/simple;
	bh=n35Ox9SHDTSmy/Qme4TpxsG0OormwGUSaHF8R+CbmQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgxGYdxpovk5ukcV7p22zjPj50lzAFdzFfrYqzczxRKeL9FMK2bx+7WHXdXn7BmS7l8tbIMszCvLD/KJ75Je+dDW5WVaHLsyM3Y9uhazZWy0iM2szKt0wCMKwvVQ47Dx+WP89ahmMqhhEXNwshAOtMCr7NgqK243RoRjJzBBNR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XYnol/DH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jDB+mcbm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBOrb83199802
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUZR9ZoYH1LvpuTJKJNYRmklMZDlDcRHYz9joGI0fw8=; b=XYnol/DHY5sH6esq
	Zw4VVSHJyg2jV3Daou7rbJmqct12kMOuELtApyREqo5d2ZKni+Ip489bO3r/zQmi
	XxaJh46WDvmmWyjv4bd0AdI7sfnMwr2CP8SRpU38mAmIlUeO+h4bslg83UK86zPM
	V/W44VwTvnrZL9lVkEjQkN5+IDoLHHg4Xm3q1oF33ouLGZfkHJPhCRrn37DAvAQg
	O8L1z6I3J3WoS6QKPx0toPf7Zjd/KOFb2cFOuRBMB5h4APvXI3HByOXDoh4ExLMm
	01uz/85QcOc1AsyBNBFY6nRMhsE0nGoUJrEBaWg1DMrnJqzk7E470Pp0bJmeUO1h
	MRFPsA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qu5x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 12:24:16 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-575dc3e7bb8so303495e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 05:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847855; x=1779452655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CUZR9ZoYH1LvpuTJKJNYRmklMZDlDcRHYz9joGI0fw8=;
        b=jDB+mcbm12xajeRLHANxBqbeIXivzUbR0F9n7ffZznXwrkDChe5TuU3TChBsyZzEDU
         IN6RhZlBk9qOkaOS17pVJjKqHyIpJUDvdx5ZQrawyYIxdtiT9xogJtNenFQLC2tb9w/C
         U8pFCu87+Wk3KzRM3a7TvzvtSla+sWcTQBeUW0SkiQHUpG9fEnAD9QNTl885wgrJ9Cfv
         Qn2ignn0/gkwALt32QnJUlkVn+GHfrEkLCMpeaZL+3lQjulSG1G3c8EUbKbBdyl9j/gX
         HdaZASu5E1qPSQm7mbD55HjPrDoJchwKvulI+eU4PRmsoDErZprQwlaUXTZYYUO3H3/X
         UmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847855; x=1779452655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUZR9ZoYH1LvpuTJKJNYRmklMZDlDcRHYz9joGI0fw8=;
        b=Tm+EPMz3Z+/ahekN/Uau6oiBEvVjxgu3hPuMDXQAyrwQGgvDztWXzR7bn5IcfrL7DK
         igCeERwULmDGof8lrDubX6OyEH05e/9EEhPNTGkPd5gJ4MN91KRPYFrpZHctj/DykU/R
         IS6gDgALQNkSPU7Q9eLlvP82zFxlBA38WjTfVRDgMrPr4o4TxZ36iAVAF7HewxDdpTGB
         dQ52C1m3SnHRMOEwQtTEah+eriwSlvDY3yHeTn3st8PNwnGsRu0PODvLH31oLxF1vdJz
         hnmNStqNqG6KwA67/6I311BVLMPF8HcT+gGZ9RK7QYQ7tCvfUy5okdT/Q0Fy7j53wsNU
         cnvA==
X-Gm-Message-State: AOJu0Yx9lOqlja3AZ5qY1o8qP8Goq6QdCzHvzQ5VS6hn7gDMxIBFGna0
	YUc4o/s8bpOCXX75GY9/RjjLJqFpkaTEzsuEwVJn3QGgmspGvUG4QIbKQay5lTU6lNT6dhAV+B7
	S+a+whY2EOQPqXHSwUg3W9Ja6bW5LdH3py9U8KPsZzBUELuaEQxdAWWlQ8rypOn4YywCO
X-Gm-Gg: Acq92OHBm0s80erH2xC2q0sOM5W/0VB7Vue6lcnH7OXJGdbjBMrCaIqz4E2cQ4ld+pj
	hV77G/q1DqKGXZof0xL8BcMbb+B34eGuyBfjj2nYEc/MXVpBadM8LBxS2Nzk3t7ugdSq7pR17Zn
	uNoYLgsvgnQbln+AaAAZxjnQh9351FFvsv+f4F+v0UNGXggMrxua7PAwGaVfNIW+R7SUsfGMq47
	GBtYAH8vwBkF4m7JNmI5lQIATwh9rRCpIviZx+yGeG8Paycq5GQT5K2oFvTKByCQfb+QCwCGfO5
	uAcI/rWxUelBT8/8DBDsiFKMGbVWIpW7gNLK6ljHFf4G1GuvWHDQWPiSGnO+AmY13Ao4idM/Ybz
	DcJ6Wi5SmpwPgn+Uf9+C+Wf8hzvYA/xcDyAdtQlNc4URJ0USaXRAVq/2ToN8m35Qv3NXIcx2eV9
	OBl9E=
X-Received: by 2002:a05:6122:4019:b0:56c:ce6a:90d4 with SMTP id 71dfb90a1353d-5760c08722dmr855404e0c.3.1778847855217;
        Fri, 15 May 2026 05:24:15 -0700 (PDT)
X-Received: by 2002:a05:6122:4019:b0:56c:ce6a:90d4 with SMTP id 71dfb90a1353d-5760c08722dmr855388e0c.3.1778847854572;
        Fri, 15 May 2026 05:24:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bd110asm221859166b.4.2026.05.15.05.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 05:24:13 -0700 (PDT)
Message-ID: <a3c5432a-3bc5-4db4-a9fd-964363f9a247@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:24:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thermal/drivers/qcom/tsens: Add support for ipq5210
 tsens
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260515-tsens-driver-v1-0-015ca76f1418@oss.qualcomm.com>
 <20260515-tsens-driver-v1-1-015ca76f1418@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-tsens-driver-v1-1-015ca76f1418@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HbkkiCE8 c=1 sm=1 tr=0 ts=6a071070 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QEtjM6DR4gV46jJZMCkA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: RvrFmsyvM7s_XgDubb66L5_qfg2nsYaC
X-Proofpoint-ORIG-GUID: RvrFmsyvM7s_XgDubb66L5_qfg2nsYaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyNCBTYWx0ZWRfX5SltPjy/Uz+t
 d2LS+vD1kpquzAuBmgjeYAk4+jTgzxRfolvN+8JBznPW4KZtymIjY/skx+mJ5KqwMlvKBqrUsgp
 uwe1SogcEj+qtz5gigkwsbWOmT/pjiPqFNIvzUt2n3dEI+z32WDmqWW1UHSdX8l1D0yvRLKeNJw
 Zg9u+RrnTXtGqaiv9petGRFM7qdqkJgb9Tn8th3Nttb4elkk1k3xWQc0V+F4Q6jLyDOYia7HLz9
 DbAWwmtvIq0X7FGESh5cluTECDtcxPn+zs0ZXcaViISxG15UqNp7I8fFVV9G+fnNztv38urjChZ
 te/V8RG/ZiViT43NsQMkFiHdweyKr6UfFtI5zea5uW4VrWiNjT+XpDWgfcpQfNN8h9/rpyJtkjS
 Z+u/TKKmOwCIy+SWGEBHrLW+mB2obQaHKUHCKDfXbYTxeo/rvkDp2jdr9zbvNUtH0B9ZW6TWSdz
 OnVUbh6pyy6v+y8phaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150124
X-Rspamd-Queue-Id: 3A88854FF9F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107904-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/15/26 12:17 PM, Varadarajan Narayanan wrote:
> ipq5210's tsens is similar to ipq5332 tsens. Re-use the ipq5332
> data for ipq5210.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/tsens.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index a2422ebee816..c0c7ecdb9c2b 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c
> @@ -1110,6 +1110,9 @@ static const struct of_device_id tsens_table[] = {
>  	{
>  		.compatible = "qcom,ipq5018-tsens",
>  		.data = &data_ipq5018,
> +	}, {
> +		.compatible = "qcom,ipq5210-tsens",
> +		.data = &data_ipq5332,

Fallback compatible, perhaps then?

Konrad

