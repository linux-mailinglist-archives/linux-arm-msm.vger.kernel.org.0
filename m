Return-Path: <linux-arm-msm+bounces-90916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMI5O0jJeWkezgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:31:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CB69E373
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F95A3010D96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 08:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C8F337686;
	Wed, 28 Jan 2026 08:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ijJsNH6z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpeq6P7r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7803382F4
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769588992; cv=none; b=p+OaTY9jTuRXuBbV9uHde2F5+d8oLcdazfLNAB0KXLnBUsbJRdMi2OeQt2KMdUW4yDCQdYf2q1rrEglHhZH+Kh9PqCAjB7kpuB8RvlySQzrajizB/16sHD6ZaORaCkNBlq1yd3SBeWjelJlbPbcqzHj0PV/BKXDHdyb76rCFfaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769588992; c=relaxed/simple;
	bh=8kZgYaAlkl/h1w1MGl7VJjU+Bx8m8zxofiPfxjhWw0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXAMYWvu2PiPBqFdoLHnrllbKAtPNDhkVZndyF+WhPi7yl7Ma9OS3PnmUT9esDUA0JX9LYoc9qW34vt7caWcO905vLiYv4NeZ1/j+pWLmjRhHlRGOxy1w2MfoNH0IKeMLzrunxpMMmtgDqnpQFrG4wp1rapyQVXhSFffRiiNukg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ijJsNH6z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dpeq6P7r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S7v5Ti2973472
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nzv7c6kvGUZdBK3n7VKc/9sX
	RlAmfRKLcFkj+4/hEos=; b=ijJsNH6zguxXs7RYryVsukEQsCO6rhn1rll7+nv+
	FHQvRdvbCiuZYo/5onbq2fB7FW8UMYUas+8BDx/w7aDc41jXqBaiMTeSEEMhgOFK
	YtzCRZDU3k03HKn22S3J3+DVxATzp9AQHRRykx/a6A+WjGi7Sd/ISKDRVhDDCbii
	WhS56lIyIdS/gFitr4/Iql2kqNIOW3LIOMKBmQUTV09nEPxf/iuqj4ItseeQBwOD
	3IVIHLuLubkXE/f6SI/8WwGpRIkIByVSOWwRRenMuxSusjT0iJZFHs7OKP6XaE5w
	styJLEkOJ3CtULtLyuTFYoKBIjsbj944gjO0qdFdilhI5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by355t752-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:29:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52c921886so726444285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 00:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769588989; x=1770193789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nzv7c6kvGUZdBK3n7VKc/9sXRlAmfRKLcFkj+4/hEos=;
        b=dpeq6P7r9917KQgaF4X4xWJgiGrUEUCbccHuXjNw5K6Kguw7P/1s8TjKuTeWRUzbmI
         VUk4kJ+DUG8Qhhiq8XojNHNLbidJ6yH540u/mRnQEn/yB5XHXln6ppJpAf8CMmqkAMNb
         oANsWTcePZr2CsTWOYQIsB5Ko/8ArkkBLueznmYEgMQkbVU2+aJRFEyMdBc3db13Qc6b
         q8MMissg2SczP0QAUm7p2ndJA7J3La1SmXdkD7HQf9vzavdiEWb9R1q2RUKXpcDYInqi
         AU6XFcred56fKzY9T7lLzrbXWVVdAgtH5/+U8k3WSn/i+Wwz1llo1aFyRj3q+Qp3Z/gf
         tsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769588989; x=1770193789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nzv7c6kvGUZdBK3n7VKc/9sXRlAmfRKLcFkj+4/hEos=;
        b=If5oiHtngGOzwXOoONfxZNOrrZX1Q6/eIGKGjKs7ddC/+23vmRZxda9z622DRolE81
         10uryTMGxWAchHG38q+IVe0vWEcvDxYTunOWAyvLdQtrsk/OULjwO8414+WDK+2dFgXO
         /6ZxN+lyQM8SJHZ2/tme1/GiZZJUfr6gWJy2UX8VF7AcyIhFQg2VbM8Ai3VwM0inUIxO
         qwY16ItUcwq47IU1HGp1tbxJUQpuBvNFJpI9nwq3jacEZcm/D4QitYs9oWXTMoBY8WtK
         Oc8jQeuVyS0zXakRnrd9yXB+EvMPDjLElmNVXEkqt9W8N/ZaP4Q+OYglo65ccNWFCYob
         /riQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGF63hX5Y9UFArtcp5Squ+hBFr5H0CmpLKAnT9WVCXCRQn0jOffdKSduLWBHMkJ+36fpdOkNze0Ons6y3K@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1zDtQEljRyqyymWg4QvQ9GZBfqfPozGjRp4sXOtyan++wC5kb
	ug7lE+Ki2Eynk/0nrf7nwvnK+Vnu6KtV4t4DE7DPmTn8lQuPftpKIwEorFa4csLZrHi5FW4CC5L
	7PslQVIQUs06K3kAOiTXkr4EZ48RrJCe4789TVRFk+7c42KPI3isoohys9n/qJ88E8awX
X-Gm-Gg: AZuq6aJI9Wwj2zQEoyO9CUCri2M8bcLzj6n7Z4H8CohI0hYb0VK2Pa386g81eOls45I
	iKsllbbaNabG+HVp+RqxhKaOwM9DrOD5rrkBCQmjEIFCxq3sV7zVeT1Z3wfo6vGsyZL065ARR12
	7kOi1Uwgv5f9FkffYglVxpDyZ1r6MDjrcSYR2xFbzUSc6togPAlsfI3h2EvPbdWIRNenV7/Npnt
	yDm03YYxXQNnvb3bzgVOJBQIatQz2T1U2Flsor2lJBhm5Aj0EWH5z6lPyYBRYycHZ2kMD98hO20
	jlg/5UOAwo9RH0Qx7mDe3178P6alMuDsCsJCzrN9sfi7zepEO90iEynJdYMQzeaIabD8H5Czr/a
	cRxU4UV5iTvz2Myo3QYnb1Vra
X-Received: by 2002:a05:620a:2913:b0:8c6:d628:8bac with SMTP id af79cd13be357-8c70b90e85cmr533025085a.73.1769588988990;
        Wed, 28 Jan 2026 00:29:48 -0800 (PST)
X-Received: by 2002:a05:620a:2913:b0:8c6:d628:8bac with SMTP id af79cd13be357-8c70b90e85cmr533023385a.73.1769588988507;
        Wed, 28 Jan 2026 00:29:48 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806d984b20sm3812025e9.2.2026.01.28.00.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:29:47 -0800 (PST)
Date: Wed, 28 Jan 2026 10:29:46 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 07/10] arm64: dts: qcom: kaanapali-qrd: Enable ADSP
 and CDSP
Message-ID: <mbtwkvj2bvfvph7r643dcojpvm2ylxvk6d33nxa3tfihkgmwc4@y6ti2e3oh3pu>
References: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
 <20260127-knp-dts-misc-v4-7-02723207a450@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-knp-dts-misc-v4-7-02723207a450@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YNWSCBGx c=1 sm=1 tr=0 ts=6979c8fe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=MrUaPYo4nwMKqt2SmwMA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: vJmhyNXAD0vMBP9SNKvsoPU0dstm_8v3
X-Proofpoint-GUID: vJmhyNXAD0vMBP9SNKvsoPU0dstm_8v3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA2OCBTYWx0ZWRfXxIBHFICRZY3B
 m/MB+MkjGUa40Eb89XMs7Mhh7TmQwdJWnq7YDlXsKfMuguCiZUSUhXqHg+6FTl4k9F/sMSg7h85
 rE404rtgvkMm3il32bczq3jMOCy0oLrBqJum2xebumFU0kdiTzVTdW2e7ubhrekECbfWpy9jpzP
 t9CZG9VQTzmhGZNDo3HXgszoIDSBMOrm0rv7BmmUBknatUuHAD+aKqzt8RUoESqVurdM6ZRp+2H
 +z20VdkkzDQBC/peMTpuWwFrOIviSOdJrsn5wHZXynjHpe0lv6ZanxZnlFKKyFw5iAo4OZ+1vf8
 5fzMhEgW5scAdcwqAQDiR6pH4KogU/PVZ5X1HzDfzdtlnnaRPe88dq/Cx2q77dCQ+7DoLiv9A1h
 EYNot5EgyEbAl7Dnh/vkCDhN5N0qKMPSwEuuRLfktBtw+SkvvxbA386lkrBMJ037bsYJS8Rn2Lu
 k9rFFR92Ytw1kaZfO1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90916-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 48CB69E373
X-Rspamd-Action: no action

On 26-01-27 00:34:04, Jingyi Wang wrote:
> Enable ADSP and CDSP on Kaanapali QRD board.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

