Return-Path: <linux-arm-msm+bounces-92456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE39MSX9imlyPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:40:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30070118FD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 10:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD26F304E322
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A94341AB8;
	Tue, 10 Feb 2026 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mLbAddnd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYEcGnEk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CE9341650
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716402; cv=none; b=Z2czGNNUSpo9Z3ibYjbEkmt6/rhegsEOCCYqJmEH4zZM/iJgRhInkFWXu8uzReD6/K+MJEVM2cZjBdW4CuJRbdbubVeqWSd8S/18shM+Nxm0mdp8rB8sEtdQWpdbwHabk0AwDaYMISw778zZi47ws6tXQuRBg87YyK2PQtwtmqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716402; c=relaxed/simple;
	bh=iJ8I2MLehXxWMGH8SM93i052CBAir46Pqt//1QASbh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rD8fx/2Q+HBboGgcpdsy5tJMJdDnDrQ1lACP6uuy1Cq+rHtpcK19e0eBjTVQRH7dPYmO33h5v6qvrcJYMTdiZo7973ySr1NYgLQyCUhPVrRe5b9clvJQU7hB3VRvmpgrBIC6eAj/RByfnHkuMQM49gnx2JJRBqIvU0kWnexQqWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mLbAddnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYEcGnEk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A3Z35t1172156
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0TAMvNeZiQWgcpalJSVZi3FF+L38Q5MAyklwP4Kb4qQ=; b=mLbAddndJbDn5ony
	egOTVcGnWdUyI2FZkelsdXo6pWG2Xk9p06LQyqwgfs8jtv1q7zKoJkESvCZd5Olu
	Xz39JOMVgn4SrsG4UcIsll0CQr7NTMHY/D0L6qmnvwn/ib5SI38kzjTrb7Nda0Aq
	L4LzVAuq2EqosezwVlLyuEm+88a9WfDLxBOxrCMMg2dpMm0DW2iEpG2gFjtOybrG
	/oC+uKEGwUoOBLGbnZApqOcDzBIwUNCAXEWnGGg14kVTpz78X070JJ6hfJHBlw89
	g2UzMyvtUVO5hChmc5Yug9js03JjvYkJ/z1w7JjH6ByLJT79R6hrPdVjKGx003zN
	ATYssQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7kftu12t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:40:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a182d4e1so95886585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770716399; x=1771321199; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0TAMvNeZiQWgcpalJSVZi3FF+L38Q5MAyklwP4Kb4qQ=;
        b=XYEcGnEkYYX6QW12NkiKCvTYOa/DtIlHFi1+Lhzet8ERnvFWxGjvZnzG+OX8ljQ5oN
         98sBosJNd9HBnHtD/qH4YyoTQJ4ycxiKmEPudNX+U/Kx++YcQGZVb76jxG/q/gYAsq2X
         36Kj3DxzFHgiFOJWWFkHAYyi1p2o9jG8DgZ8oleYe3LFCcwMKidSdstgOAONWSQzhKrZ
         8iQ3LVY7YrjKosrkq3NrqDTBHxwdOdHj3cc9MgNCxVeRTze+pR872LYA8f3NriQl1WOA
         h0yeQon7KHFmEMG8N2XHDMQHqd7hpfKI9uuOnNxw+LTxFhnvE8udUZ9jf/aKK0MMIv1I
         oo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716399; x=1771321199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0TAMvNeZiQWgcpalJSVZi3FF+L38Q5MAyklwP4Kb4qQ=;
        b=Mh+E3QT3TSKimTlU8w8/rmu8hnvDfemb+Oo/O7Q56S7og0udCC0+IOEc0X0BkUBABf
         ElRQq0nmh5kh+RN1ljnOYSHbjXM7lPoxvE/D6xP+uBfEOuRE2hoLQczcgNhQkdEfgTjC
         16GOtLxmca6NThDpeFcaSRaCazKuFOs3SoZcU746H6FJSlIC5PfrYUqdSsU1glOApONr
         TGXTEvO4ljxmBDO+8QcLTGGCDcKxiYG5XHiLLLanzfGbgdrif95G2nyNOeVuoVQtfhrY
         bCGs+fPPYoYGGbX/LDuqfVKHS2szNavaoD7JZV4KxJl24AgFL5nPqFeCwdeHNMbpakTR
         7JOw==
X-Gm-Message-State: AOJu0Yzg52k+eUOn7RPrNqS1ZjitMM/cCBoQzTt9mF38VHmk6oDDvRzZ
	CjvSgmIutT9kY5KroEal+MolOHm8LGfVGvYhcqJtn7rHKBAX6vpqMEgnZNT0WGrBj7eBASQ50xo
	DVdt50inXfYgYjrCW034OJ9I0GXOsuAa8393UomUOyIFHRnJM4fvYXj3R+8J0LdkMf5Y7
X-Gm-Gg: AZuq6aJIMe7NMpUVJXz/xtPuNkXKXJrQz0iFvppnGJAU8Go8jk6h44lZzQbYtAzT/au
	GmuqZC89Ju3iEQrSJDbJcWJdOeU5yBNlz/Z5dQexPy6BV4aUa2hcz0MAqSQxHXAG2KPJbDb59Mp
	IUnCL6t6uj+pZwMA/e6p/ejIq/5lu5nO/5p/nXEVssG3jkEmYkbIKyJSUzIU3tFbYsyYYDvAxC+
	sX4TUMDGf0xIq7+JYbAlzVODMSM/DqSghSaOvSSAxMWZZL+Rki0Sdd4om1S/J4FQ/gPZRcvNW/g
	LZm75oKMvuF/r1lbhPvr+gaRLLqUf2y8K7pRQxeel1LljW4Hs3D5dnMCUvElvYHpwfQPHu54BfL
	q4V39B9ZihyJ/1tVfcxhe19rVwoIfYMpHudEJXQNEh96ZPD+0OReWt72LRi5hkrfzprRrBwtqnR
	7qqNc=
X-Received: by 2002:a05:620a:468d:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8cb1fef263cmr107729485a.5.1770716399508;
        Tue, 10 Feb 2026 01:39:59 -0800 (PST)
X-Received: by 2002:a05:620a:468d:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8cb1fef263cmr107727585a.5.1770716398983;
        Tue, 10 Feb 2026 01:39:58 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae3ae99sm516585566b.60.2026.02.10.01.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:39:57 -0800 (PST)
Message-ID: <7d61d324-0d26-47ce-aac6-d17abdcf05cd@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:39:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] soc: qcom: ice: Remove platform_driver support and
 expose as a pure library
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>, stable@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260210-qcom-ice-fix-v2-0-9c1ab5d6502c@oss.qualcomm.com>
 <20260210-qcom-ice-fix-v2-1-9c1ab5d6502c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210-qcom-ice-fix-v2-1-9c1ab5d6502c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MCBTYWx0ZWRfX1IcqNOFOmJ9W
 XCdCSwElqUdmstPXRcZWnIrJ7f/SK8sOEzgl7ZiPUW8y+Y4AhrVd3dO1IvEuAVFgLQZoUiazdsv
 68Trs6E3isF49mWSeQJ9IOWRksFnVnXDnn9GYWLL2SeNRWpwXlymKAiP1cgDD/P1XNN54CFWwDe
 Iudod02BoZ42Z1qahkS38sa8rSQADVgX2jZVf0PcweT8+hSEFPknLMZ64cleunLmfKtmssnFH2x
 x1z5OFNhvUZ2lEGHgwkYe6ajnE47z2oo41GWkpG8tu/2/subiMOmOIVyHTYgj66MKLcpWPDNtkA
 UlT8ShcjJBIDMmfVXXZk43FnGrjL9ywOwlO7lu6ULc3CSaiS5Qvuzl1l2+zUtqW1JMgohM4sUPf
 HJ5GJmVJVI4K0QjKCFvuCiDO1BWQB2fxWfGuI89qTP/TeLzCKk5DmIkIR0MAO5vSB7THdqP1/B2
 QovNeiWr5hwbAhzMHxg==
X-Proofpoint-ORIG-GUID: MD_aAKlsQDPf_otDuui9xYiY91pdNceU
X-Authority-Analysis: v=2.4 cv=XfuEDY55 c=1 sm=1 tr=0 ts=698afcf0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Oy1HdLtELvYQmIkUJ8cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: MD_aAKlsQDPf_otDuui9xYiY91pdNceU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92456-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 30070118FD2
X-Rspamd-Action: no action

On 2/10/26 7:56 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> The current platform driver design causes probe ordering races with
> consumers (UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE
> probe fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops
> with -EPROBE_DEFER, leaving consumers non-functional even when ICE should
> be gracefully disabled. devm_of_qcom_ice_get() cannot know if the ICE
> driver probe has failed due to above reasons or it is waiting for the SCM
> driver.

[...]

> -static void qcom_ice_put(const struct qcom_ice *ice)
> +static void qcom_ice_put(struct kref *kref)
>  {
> -	struct platform_device *pdev = to_platform_device(ice->dev);
> -
> -	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
> -		platform_device_put(pdev);
> +	platform_device_put(to_platform_device(ice_handle->dev));
> +	ice_handle = NULL;
>  }
>  
>  static void devm_of_qcom_ice_put(struct device *dev, void *res)
>  {
> -	qcom_ice_put(*(struct qcom_ice **)res);
> +	const struct qcom_ice *ice = *(struct qcom_ice **)res;
> +	struct platform_device *pdev = to_platform_device(ice->dev);
> +
> +	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
> +		kref_put(&ice_handle->refcount, qcom_ice_put);

IIUC this makes the refcount go down only in the legacy DT case - why?

Konrad

