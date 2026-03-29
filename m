Return-Path: <linux-arm-msm+bounces-100594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPpVOf76yGkrtAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:12:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 540A4351871
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 12:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F9A9300FB7C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Mar 2026 10:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8922FFDE1;
	Sun, 29 Mar 2026 10:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDdB0hyO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XglhH3Bq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D533016E9
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774779131; cv=none; b=BCgMXTdzf23r+dhQlR5aYHlfyFYAqGp/DBXkHtIv5HKpxTNVVSwzaDJZrh8FzlcBb5WRQjKg09B9J+Sb1fZPqJgi35iCR3xSA07ENwnisiIozJoWjAHK5/jYCiIEeIM/Z5rx5LYj+e+WuMDphK/PLwbTnykALMa/VzFPAHwWxb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774779131; c=relaxed/simple;
	bh=dTsHauF+acSw2UdratfwITblpItoGJWz/NTU8kZd8Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m7dZn5Ia2kIMm7YdDWHn9HNxZG3CvTWGuB66avsQ4Jm/9XLd5CnbGJXm3e6BpLXLpvCdlQdikCrKwPMNaJuqP5ez2NyuOUOiodXqF2hRfQ19uvHZ/9QE9MALAdkrh7poeMu6J1LLwF6BZF/HrBpGN3USBJBAIoKcrNP9iskN9dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDdB0hyO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XglhH3Bq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T2cLIR784104
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qcamN5b4r83psLd3XWUhDk/8
	Hm8gMoREH44LLVdVMo8=; b=bDdB0hyOPIfAI4NHVMaqK0JQBinty95zlRNWsiZE
	d13UnfXiyROzhzQOjpb28Y/7YVOAVVfLRqeyGzZwG151eCPQTo+Ngur5HYFPITCl
	EX0phWmKFtMeIzRMKSzfLbpz/v3aujEMBw81KbwbiWSfrrLPiYMVZr3CRezvwG0j
	uZdQkTm6U61k5x1079IIhMu9RBIiZ9XBhmtpFO4gDGOMGToUEy9XxePKWtZCPmuM
	OZnV1PCOU5WtA/qTk7g7gAu0y4uNZvufV3ySx70EL4BCKV3mkTJ/n3vayy3PF94R
	+/I6WmrwB3f1dQR79dkbYlKxjHY3WPbkWRX+dC4JrqAwUQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmgksj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 10:12:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50939597b85so89324171cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 03:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774779128; x=1775383928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qcamN5b4r83psLd3XWUhDk/8Hm8gMoREH44LLVdVMo8=;
        b=XglhH3BqG3tVkbr4abF81ucif7kRvGpI7advNR4GrtPHQoVtKi0+Z8Uiwp07oy6S3h
         wYAlPo8XmWJzD40Igs4PR+2S8TNg1snsXmrVZq+XdiOSUsdLjcL+ekl8iShx6eUDq95b
         +QoLwIgdLb7Z+MkKR1hGyewNjqPWMcZ6y0ujwjRrNerXu6GBYMSbRDqAyQ4o11qwUsmu
         I9JTJXJzypJyx7UknsQCodwrZrwdSMEltrtfkrsxQn5Z7UtrUe+dBqeCPUjMw2uuQhpw
         TcSGXoKj4HaPHdXvxlZ+AKSrSZNJVqXRy+cP/eZmjZTOGl96FhulkfX1Bk6ltibFdz1E
         HxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774779128; x=1775383928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcamN5b4r83psLd3XWUhDk/8Hm8gMoREH44LLVdVMo8=;
        b=TTyCkJXIYJvwicbF5gWZK9Xa5ts1Mjr4LsK7sumuNXV4rmwWug5lQFrsJSp1JY8FJ0
         yDvu+O+rzbrGPo4Buy+p9S1eW3QTOp0T3kU3VHvkML2GYA6aYiLqSTCXr0K8RFOqsQPO
         xEmKpN4UlLJ+ab6WjcWHkkFb09DaMr3acGqDcymIUzBeh12PAHcY14GM7Vs8/v/T4M9I
         juQgcG3lNwvTcfdoQFsV1HD5d9qq0eoT82ZsUW0BGozCp9TL6gxb50vCoMpiEmK3LPAn
         NROYZ2xbf1v1T+fnfVR2CYpxWRmQ0CZcr6RiEWBlwVzBL9WnOfTqF96vicAkgheIFfwn
         B7/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKnnWW3BOe+uRhlwpG6HssiSEKXvjQhl3/TZKxTNE/EaPxxqFFAYw2vx/v1jc7yB8i0VK7x/3lGCj5VcMq@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwd7AOS3hgqZlWNoUTz5JO8pM0HX2omw0VKgBb+P9ntm3yDdrH
	+w2mZdJt9YvHrwADJwunWZmYKQXe/Zcv/yWzg5g45rDYzmwFPrHzR1vWtBUXY54L6R4naSpqLNh
	/TaLIwBOklK3lREI8xFoJmfiOoOQ8Zaj2yOwhjfwdaPxbH/XCk/IfRDsT9QBu038gVwYR
X-Gm-Gg: ATEYQzwliSJaxf6wr/Dx5tszawgJAUDNTh7wicoTSauU6V8CqWxcWPKoWhKad7TKAl4
	gXgnx1Qv+RFFHxbvemUBUgm/iyJNj45WVSb84a4rQcMlb2EuavZxK6AHuCXe7VcwS3rN0QZNs/v
	HOkndqlX4uWKmNLD1bzGhwQHWHcZPRlYdAKDSOoCtYj0OttSYkZPSyHyMAf/eySAoyOd1lbY6i1
	4rfM20g9akmz7OU0VPlSuyywDyQn/woteO+58kk3S+sK8szj6r1dBuZX7+JRSte/RgzjNga1Mjn
	HwhkvR5Tv9S/ZY3r7Acc7uoaUEX9rV3ZtyntybXMyYvmPQJhlY8/pE9lBXBzklJvbe/eEkmSJII
	+yWaXlen/oZ9gN0rZ6xBEYkmEvhqwSrsQ8gtKvdiiUhxPCwLTIzvN6ieUITSOARn4AHJLosDBj1
	Y0G9Mo9N6X7SObLMJLSZq+MYIHa9g6UBNXvGo=
X-Received: by 2002:a05:622a:1a93:b0:50b:532c:2ab4 with SMTP id d75a77b69052e-50ba380a52cmr118052361cf.12.1774779127732;
        Sun, 29 Mar 2026 03:12:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1a93:b0:50b:532c:2ab4 with SMTP id d75a77b69052e-50ba380a52cmr118052051cf.12.1774779127248;
        Sun, 29 Mar 2026 03:12:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c8389524esm8614521fa.21.2026.03.29.03.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:12:05 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:12:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci <cristian_ci@protonmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Message-ID: <o2sbqzcix74u46g74sil2c3b6mgd6zsrmafesoqltfbbrzqhjh@uochk3so46yx>
References: <20260327-rimob-new-features-v4-0-06edff9c4509@protonmail.com>
 <20260327-rimob-new-features-v4-3-06edff9c4509@protonmail.com>
 <us3ps4bgf5ekk2iudcgs2wa4b5qd4mzokec4q55pmhb6kvt6ht@qm4mmzdai2t2>
 <O7THc5h8ZhgzNpklYKTGOnEZKlN4BtHZHjKZt2KErekNb3E-hizt2dw7xuJ8G6giEyivmvC0f6-eIfCT6fJkUA7_CVQwhAktCXfBqAVV_Zo=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <O7THc5h8ZhgzNpklYKTGOnEZKlN4BtHZHjKZt2KErekNb3E-hizt2dw7xuJ8G6giEyivmvC0f6-eIfCT6fJkUA7_CVQwhAktCXfBqAVV_Zo=@protonmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA3NyBTYWx0ZWRfX7f/12uiscH7h
 uHm4q3w6E0FLgKRurMHAXNWKSRVZUf0npeATMbpZgHqhsZ4PuUrXqdOFC0cdGJO6PPig0EXMCtM
 YxObGI2al7VxN8sStLYhrXW2bnpRMPtRNpMEzKGq46Zo4bywDmOX4AiQXGxCLh2VOVbRcvwfUeW
 gc/hK0Hp4ohR5MvcKkE/NJZUu2dytgHhBk7FdOgFhES0/lPvhb/LgL5BxsGjzx4iIH5Ne0DqFdB
 4O6qsh57g34vpKc2PbTtt91K4SIPo2A5KrAdXajxQWpgatvft8c1iaUa2NqjfV5lsBXP7ZPrhXv
 pgF38TIswerTQh+3nReLH08o2VAaoyMM3Un4J76ROxJIF443qYD2hc+3CBJ7/Pc0XOMj1NkawLx
 D7kMU822NLyVNLwBm+7ST/cO0tPgxFP2xC4EYOM4nYta53A+qgyvmpuB8B1W6SrTJqiS+tkwm79
 wMxPhmQj4W7ba559XoQ==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69c8faf8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=sfOm8-O8AAAA:8 a=BrrjAlgp8CM1T73XSN8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: BZDUCi-PXazp6MyxwIbnvDdgJJgEGlFu
X-Proofpoint-GUID: BZDUCi-PXazp6MyxwIbnvDdgJJgEGlFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290077
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100594-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 540A4351871
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 05:30:53PM +0000, cristian_ci wrote:
> On Friday, March 27th, 2026 at 23:57, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> > On Fri, Mar 27, 2026 at 03:30:49PM +0100, Cristian Cozzolino via B4 Relay wrote:
> > > From: Cristian Cozzolino <cristian_ci@protonmail.com>
> > >
> > > Add the description for the display panel found on this phone.
> > > And with this done we can also enable the GPU and set the zap shader
> > > firmware path.
> > >
> > > Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> > > ---
> > >  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 73 ++++++++++++++++++++++
> > >  1 file changed, 73 insertions(+)
> > >
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> I wonder if I should, instead, edit the compatible property by adding a 
> second string (for the fallback), like this:
> 
> compatible = "flipkart,rimob-panel-nt35532-cs", "novatek,nt35532";
> 
> and, therefore, add "novatek,nt35532" string also to (patch 1/6)'s 
> bindings example. Let me know what you think.

What would it mean? I think we usually don't include the IC into the
compat list for the panel, but feel free to prove me wrong.


-- 
With best wishes
Dmitry

