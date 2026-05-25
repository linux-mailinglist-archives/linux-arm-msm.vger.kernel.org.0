Return-Path: <linux-arm-msm+bounces-109588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCf/Jg0KFGrVJAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:36:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DE45C7D7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 10:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DDB6301E9A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17366332621;
	Mon, 25 May 2026 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZBfZLuj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wj2klee+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53523E3C4F
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698150; cv=none; b=Dh+5wXmb4pQ1bZpWTr3ZlzMb1FrFcEUrOhwT6+F4bY8QZcc4ZBbp7ITFB2yfW2ZKVfsQybT633KzoJuTs5ba1PO0DYmKATv43btC4aUOJaiSfiGhZswKaN5pu8auTIRUxIwpAsaYJDy8Mo4/B716g8Mugvi+hLM2Drq2815VIwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698150; c=relaxed/simple;
	bh=I2MAiCnnFa+M4QSFFwvmD8oY6s7q7pmNHYOivoqkjhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/GZttiruGqhsbUpqpX0KDu0w4wN2IZY2kf4xSXc1B185O+LRu/WFGFRnxw4SGFnFfCCg/JBt7dAsTSeieS7/mE7j6km85SXgWy+NnQH4aIrwEB84jAmk0OV7hPLpcOsEJoEIC6CVxfsJzYGEGVBSMWXFWXts/aX+CtsSTVzI/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZBfZLuj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wj2klee+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P686QY803976
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EHsuf/oTXbo1Vza9tR2cpzEb
	OYDDWjdkQoOzilrn9IM=; b=YZBfZLujPs8lNeT76Pc//1R2VeHLqy1kN8Q5HRzL
	edVFsmLuY+ymeAa/sZjxVlbClmJ8PDcoMRRQ/Wg93dmyIo+o2xwMwIrgJ4sA15yt
	LSY1Pu0YtYOwYN0sAgDf3mGudp7TIsbQ2x0z35eUBECFEwWzmL6QmOSYgJ3a11ld
	82IaoctnYlYDlWBqA9yrueB6HSlY9qlxLY01+OBBF7817OUpDo5Ql7IlTPVAMuGL
	tVisgikP3PGmT8Y1CeFJcRp70s6mri/Mx8HfSSW0J45kaZwQFkggXQ3q8iT3YPZr
	lLhTM0iFVdSUOkrTDFKuPYmgvfRi/Dj79bNSZRe18+QCLA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0w1hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 08:35:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-639389de134so3998924137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 01:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779698147; x=1780302947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EHsuf/oTXbo1Vza9tR2cpzEbOYDDWjdkQoOzilrn9IM=;
        b=Wj2klee+y+6dTTyXwTTrgId0hQF6ih61ndHAFbDSy1/9U2FdUy05NlQggU+evzgbP4
         XNTBaWc0T209to0MRyxB9UVJelDZFhm/OwYXgkD72PsxI93CqnxjZLK5CXBaZqm9wCMF
         DLQ4C9crjlkSnZblLaDAvthfbq6DURQjKhZgmTdo7Rc82bEtDWiCKo+8olvLxRntQLBf
         FPIJ7gsr6km3njoJ9JzutvohPT6Ii6W1SfJOgWTArgTofgK7jaEOzAEQq9qA99kDdG8t
         W6j84j4HOmcvgToe8bXjB/7FrA7aACYuIg1bLhizTCbA9GVcwjry7cApYbfdiJiQ2BjH
         TkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779698147; x=1780302947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHsuf/oTXbo1Vza9tR2cpzEbOYDDWjdkQoOzilrn9IM=;
        b=eAkSvvqZg6cHh7rF6vgV+o0uQvPz9fZPmloac3c5MEwyVMX6/mcrJE8gdmyYZ1AuEK
         2vX1k3/4YIE1uNc0VVPG+3tag16rdaUD9Vq+vvqARsY4B9ZfRCZ/JB4rnpd78z3AUu91
         0wn5bLlEtkA+I9rOq/yWV86oYrSySZjtM94wcWReJ0D5m6gspb2pqMamOdBaYZw8i72S
         MpZ0eotAhVe1ErGfxYN+SRPp7YgIeSK0UpUTvcq1Sad6sXHNE/0wABloN0MvEBf/GbU7
         s7ucNav90IjtwvroVIBINLbS/6TBhNU6zYPpHacqMw9FFqpF5+fb6u00yTpUWOu9bRAu
         NYLA==
X-Forwarded-Encrypted: i=1; AFNElJ+9lBEvMf7v1D892ToLvZfWViDwbSYjV/wttOtLVCtOyoppa9qVuKPGBskkCgy5EodbCsOA9CvLkVzHSImX@vger.kernel.org
X-Gm-Message-State: AOJu0YwxEPOuJoENI4v96ldTVt2P3DATRhO0zILIPAa+N3/LoOKdBt1h
	38s0KSxoKiwN43oZY2teUjP444PpD3R7qjoY636f87P5uFvzIAXK2lA2RSgKyuz1VkokbtalfHQ
	Lm2n5R6JHodYDzdLMW9Eo8jVGYaJvK+4T/oCSKxKh4OaIoXsrbPyc/bcY7HuT3kWKNUu5
X-Gm-Gg: Acq92OGMGOrWGdkB6at3Ba3PoCLA+uDwN8rZ1I9/NshvVbZtUDVhkA4oZZL3xfIznUE
	kGwGUvpKEKyC9dO89cb5W6AWZbzPSoQxHfbYUqEGk34asttwt2V0se14SQBx2YbhX0IDStLXCBq
	acurX8uXwphwiEB+5urT00NIUCWfKMIzWNwzGx/QL5wHubqHs/GrukuyWHE7je9eMgJmrWd1zJ5
	2aqIbIJ+dAglNtNz1Q7iMHnOZgdEjHf//F0Rzs7NTemcKJzYVS+idGmad7ku0OxjN1yf77nfqDe
	nhNlRt/KKKeeypOX2QmGtWXRFC3q1tcQ2gT05GjWvT1Ya3n4PXPh3Wzh+2NIT5S95yZtse8fiXv
	Ktd9fm3zBqV/7LB5mp1vssVK5qvFs7C12xysSZd3cOCF8cKDRL32s2VikmYvpIfeH+pdU4PMvAz
	2UG0R41b08CPxaAQV8hEczuqY2Dh/Bf3a3+M8=
X-Received: by 2002:a05:6102:c89:b0:65a:fcea:5a4 with SMTP id ada2fe7eead31-67c749055f5mr6447094137.4.1779698147082;
        Mon, 25 May 2026 01:35:47 -0700 (PDT)
X-Received: by 2002:a05:6102:c89:b0:65a:fcea:5a4 with SMTP id ada2fe7eead31-67c749055f5mr6447074137.4.1779698146619;
        Mon, 25 May 2026 01:35:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf4f27sm2489401e87.71.2026.05.25.01.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 01:35:45 -0700 (PDT)
Date: Mon, 25 May 2026 11:35:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] dt-bindings: soc: qcom: Add Maili soc related
 bindings
Message-ID: <5k7sh2yooj4yn4wtpifyamaw2dglk6xwbix623rvt6i2idkxr5@63rbo7ncduym>
References: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524-maili-soc-binding-v1-0-fdf9f9ff1b23@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: jq8mrutxSI7xpGzasYerIXHkG17whpAz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA4NiBTYWx0ZWRfX4y5aGHvgZzbb
 3FG5HRp4Ewc0MtA105FFvs4+Nx9t/PMYpdUuhq6zAACDVdBgOzCM3jrzs2/lzgE8JKDOtpd2w0v
 W7JuhLfTzdxpf58CR3bCswkOpIC9V/IaLrqeyhBkMUjmOTHvj8SdCbiNc1H24E6h3dOiKoVT//N
 hzwh0K3xaoAzPxv1d1qLAS3mTHaMY3wA4+lE83QkoRdk0KQ/0NJQmXnaiMehC6D6mqe3M8yP/7r
 MaeYdf4vYw619zPzpaJKw8CQ7ITQtqbhgx/hWiqmdG4vISv9f7tLnhbAiq2Ytg4liMIG3RescSG
 xyR8ilatB/SKOzOmG/rqzsTWk34PDRcz9HfM5QC1kYZUDSV6z+X9Lqq5xMd2Q0I+Ln+ONBrADY+
 TIu2/SC5mDOrvSbKIkrzk1rRurOnOBuBC3mpuyNCtytMtOI3d4GWTj9dMeoZTCHKtlTFkfV4NGc
 Q5WBhPJ//GBxJSj0TXw==
X-Proofpoint-GUID: jq8mrutxSI7xpGzasYerIXHkG17whpAz
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a1409e4 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=NSv3qpHqmDL8PqNx4EkA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250086
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109588-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gurudas.dev,oss.qualcomm.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29DE45C7D7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 24, 2026 at 11:29:43PM -0700, Jingyi Wang wrote:
> Add soc related bindings for Kaanapali Platform including aoss_qmp,

So, are you adding Maili or Kaanapali bindings?

> imem and SCM.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
> Chunkai Deng (1):
>       dt-bindings: soc: qcom,aoss-qmp: Document the Maili AOSS side channel
> 
> Jingyi Wang (2):
>       dt-bindings: firmware: qcom,scm: Document SCM on Maili SOC
>       dt-bindings: sram: Document qcom,maili-imem compatible
> 
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml      | 2 ++
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  Documentation/devicetree/bindings/sram/sram.yaml              | 1 +
>  3 files changed, 4 insertions(+)
> ---
> base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
> change-id: 20260524-maili-soc-binding-2a2287fce578
> 
> Best regards,
> -- 
> Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

