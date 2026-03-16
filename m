Return-Path: <linux-arm-msm+bounces-98033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM+OMgpvuGn5dgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 21:58:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 301502A0780
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 21:58:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FFBB30F8325
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 20:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A9B535CB88;
	Mon, 16 Mar 2026 20:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hvc3m18f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EaKnPeTF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FC435C1AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 20:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773694562; cv=none; b=FDQ0zo+FUH1DkFbXgCQ20MzvS/vLqk0JB3yRC++y3w0OLinlf1vHH9MIf6JY4aH/AKcWgl7/ezealPiJR979ntKEJaFTsPmL15QiIp34FjxiefyaAtN8+/wku1YMcXF1vCaAA1UUyl1yJveRYhwjUifdBdJvJJ1/g1ee/gewhE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773694562; c=relaxed/simple;
	bh=hHnaCO3yPvlg1sAe3Bk5T0zvMZGvOzygJZnvsGKfqxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LlS9izmb6tPjnkAYY0qes4tcPhvICYJs+lpf+JOSD5htgUjzPNGGIvhklCLqgeErPlON9VM5L4KzfXOH0jGoyvszrdkKGpjpl2zRabqBhL2tkCUFtbMzCvc3N0aI4iMicjaZ/ylAkUBEM3kEyLSpLCAQ8Uya0MKIrx67e7hyZek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hvc3m18f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EaKnPeTF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GGFlDG3125457
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 20:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xXH4KTGm9N1/4icJ/ulRPZ2l9E6SCinN+yvg/kMT4Xw=; b=Hvc3m18fpCHkQzD7
	M6U+MdbUsXg3NwhK7sfrx/LfURxLx8JZHHGxfJ0PVnMu2dDR9qzm/ciJCejHHHJe
	cadfPUtogQUh/rzDu2zU3M74twM/YfxLoQf06YOBkfTT0cN+w3TX3QwOIb5bhIkD
	Tk6/cWd+GE83EiCH2iNCHmxbkVwPgNATYe4gi/1mPCoei2noj15bovGmLM9LuCh5
	nAEBduXY3zi3yZJyP3Y0L3sXky4mEJYxSYCzs/2C/N+lCQ70NvDqrk4xWac7at7d
	dYsLWdIrjTf7eg6a/56+0ocO+9STrFlggUgGkvwBa8ufDdY4L9PVK8x4SftMZDh+
	mF8QXQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmj9v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 20:56:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aecbb78e44so193998605ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 13:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773694559; x=1774299359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xXH4KTGm9N1/4icJ/ulRPZ2l9E6SCinN+yvg/kMT4Xw=;
        b=EaKnPeTFKv8LvUk/1ORApmzbwpkWCgI6prypdxzjnqqtifs4Xt0+ByyKogyYcwk1nL
         aFn4tMtCLrd45zJOl8rkOoZF+TfVKzB1JZzLmPUfJz5BazEMu6jT89SLwYP5mA9dCw5o
         afrscH6pdbPUV8D9IWx/WQsMcE2TZZTxeZ3vle5UqH0oXpI7Fuhp5NPm5+2bf0UKTKOW
         OB2aLkwvFDpA0q25LkDv6mbIMdYMB+gaVQr4wh8hb0/zdyQi+by/TA3uO/CsrzfWeCx5
         n1QCQfNMZhoXqSbTkLEzE/rGBChiqRgxmLMgOu6kOd20IQDoBmbB1I6SfuPqWbmFQsS9
         mfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773694559; x=1774299359;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXH4KTGm9N1/4icJ/ulRPZ2l9E6SCinN+yvg/kMT4Xw=;
        b=j+Rlaa/sCiP5qmO8r9l+GPaUbsR8Vdzcgf/MHjJsMwiGQ+Q+soScycBr5w2XoNWVcf
         wLBRcfQImeGd56N4mlq4/4hoIR5bsruoneyL0q7+8/6xhWuDvYjBSYUX6Kd9aCo6wLIl
         QyYqqzI8Ri3avZRz95KGZsceJ4vaO1ElQsSSgaqtQNsJubT++mUm+GHAoVJ8LlmRzXwk
         4CvSIFPM2qtpVEOCUeVSxIz60jdQsvZ+kA/bCm+fHb1BKN+mE5VvCiJDU5LU4Z9kYkrl
         t/n7FqeT+N88B8MoBA7ogOjO9vqKgm7t6K3CXO+7s+XERTcwtdSCTLl96nP8kIoCk6En
         s/ww==
X-Forwarded-Encrypted: i=1; AJvYcCWa6XG6gTK+LD3HJf/trp+dSIpGF9O1VlZXTW9yNYxaFMzQdxGEhIQnEo4hil92SA4HDJJXJDsNTyHuebtY@vger.kernel.org
X-Gm-Message-State: AOJu0YwYOUxyBhvwLDeAx6PB7WxsVno+QCYItv9OEUp5dPynk9/cfI4j
	yGHyMjQ2XQ34mdD/7uR4HTXOQuoS+GCIyWTyJSkDZLltWdm73lhjnzCKeY/LD3wveeko2u5lsYm
	vriXycBG+9j548rp25a/reEEj3LhRGTERRoFsA3FR2SRWQOF0iFJbmKSEOgvSuV7+w/KNiSkhCx
	Zg
X-Gm-Gg: ATEYQzyo/SUVdkYBesO2uvDdobgF7IxukaLgeSTG5DzyhDxhsv86omFN3aeRmdwzToQ
	lAxtTMSIH/KyMrcR1t+q83V95iigk3Uyl0t+aru1fD2vPn7emi36Opo+abr7Ulo6ZkEOA+CWd1U
	Z+g0BhKxBDoRhNmKGH9HRSBhJfryIo3nX/YLgYKl3ZW9iGqAanX/HhvGS0Fa/aiyi42DkeaX/SS
	zb6r48nGRGX1tnAk/jO2iqOYOTY0GA380UZtZMRUiWaLVElsaVCOR3WoaThWAwv7NNFZTBDrS1F
	QTjK44UxrUnR6/vZPlr+qOPxVvTLScCAR23gcOqjn49kx30ymYBjWTFl+TrUx1zLjtwxDWz7V9V
	RZCK3NjWJpf41RA3eVH9a4hv+faGVbutlwGDdFdiQWLUJJw5BP9eSKLdEDpeXRR0l4/g4deHfrg
	oKcSM7
X-Received: by 2002:a17:902:f547:b0:2b0:62dd:3a80 with SMTP id d9443c01a7336-2b062dd3cf0mr12638245ad.17.1773694559382;
        Mon, 16 Mar 2026 13:55:59 -0700 (PDT)
X-Received: by 2002:a17:902:f547:b0:2b0:62dd:3a80 with SMTP id d9443c01a7336-2b062dd3cf0mr12638105ad.17.1773694558954;
        Mon, 16 Mar 2026 13:55:58 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c27:17c8:7897:b4f6:fc6e:b55? ([2401:4900:1c27:17c8:7897:b4f6:fc6e:b55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ee9f2sm120239795ad.56.2026.03.16.13.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 13:55:58 -0700 (PDT)
Message-ID: <2b416eb0-ec84-425b-a845-3995fb2fda4b@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 02:25:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/msm/adreno: Update GPU name format
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
References: <20260316183436.671482-1-robin.clark@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260316183436.671482-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE3MCBTYWx0ZWRfX3cv6Lr/8j/5r
 D+2D/pJeOaY6A7exJMRY7vjp7Uw7ak+EvFp6Ej6CIaOOkMjRyvJxsAY+qLsZGvvH8DMLvB38c7K
 LPDh0uhwtTp4Y5NXKxH0d2gcgPTNu3PiqmuHPxvEb3a+yV+uwbONsnHI2SwuxOZugHKmSFrhP/S
 GxjwqnZtZluZgxJ4O+ies9d+UNe0iGg51L5FFaNpbICAefpCkEu8E6LqOBWpacsOr4YhNi0dLyC
 mEh+0EIKnAtxUP0SSPVwrt73ZJArm6+uX5HMGeVz2VHiMUP+pPMt1nO0M6/yjkuul/0/id9aJeT
 1MqPmOpXWCxTWaKuXwdE5NLn9vYN7FGh+PwrFk+z+s7cna7YIRIPNuOPHy/pp63yaqhgqfKc4iY
 p1dZqt0nv+DKv5ZyzYZZKTA3BhqrRdOK9z2TB+phaV8atwzHnTVf6Z2bn9jAFS6g8puO9yrqbLL
 SnPNO/G4UkbT4RZEHYA==
X-Proofpoint-GUID: DNGO4h_8ycRnCeV5ATQECv1jqm-0Y0i5
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b86e60 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=cqCk_WuF3EJCmBEnIEcA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: DNGO4h_8ycRnCeV5ATQECv1jqm-0Y0i5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160170
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linux.dev,gmail.com,kernel.org,somainline.org,poorly.run,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-98033-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 301502A0780
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/17/2026 12:04 AM, Rob Clark wrote:
> The "ipv4 style" of formatting the chip_id is less useful after a740
> with the new chip_id format.  Rather than doing dec->hex conversion in
> my head, just switch to using %08x, which is still easy enough to read
> for the old scheme.
> 
> Also, for a8xx update the name after patching in the slice-count.
> 
> This series only changes things for kernel dmesg.
> 
> Rob Clark (2):
>   drm/msm/adreno: Change chip_id format
>   drm/msm/a8xx: Update GPU name with slice_mask
> 
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   | 10 ++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  8 ++------
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.

