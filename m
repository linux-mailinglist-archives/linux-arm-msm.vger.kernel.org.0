Return-Path: <linux-arm-msm+bounces-101109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFC0M3sMzGnGNgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:03:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C51936FA6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 298463073D99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 17:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04913D5227;
	Tue, 31 Mar 2026 17:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGrdtndK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kUcRxXns"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B448E366056
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979778; cv=none; b=sVA5WTf+u6iWBq/oRZtR28xQC+SFQ9g4R0uZvz0xzF6LiYPpxQcEEdjlEkCzXvBBkJBJ8Q15tw+V4XehGlE752u1G/flDeVhgioAxXSxyNNC4K5p94NNjbapk5tRqPRyFkZVkxkag155j2deE3dYPET4tUiNnLJt/IV3pxPEm10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979778; c=relaxed/simple;
	bh=ZdXSfm1vWmyQa4dIhH/t/qYuxXtsBxIVVcJQZcQgeS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcPlsPy3z5Chh/bD4nKHHyFjHtJhNSsER4BiHif1OyNZmg2Lh83Suvod9XSfjfS8hLXZ4fH9qKh9FAQLFH/v+yKEcmNJYh8hBk4Ir+UaUVzphqfrMYnRp6kugCo8VPWLeZUPkcrKm7OkqBJQO4ttQ54KE6gc85E0yvW+R8DB5Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGrdtndK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kUcRxXns; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdjtw1056497
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MCRugPqLYDDnJKePiagOBNR7
	ITOuQlv7yXrdfNsjxWg=; b=LGrdtndKWiteP5dEpa+YYymmgDQLA+QvshnBpBEJ
	KYozNYCbI3ymcYYiX00Ri2P+u23uzRjFp1d9q1LVzoLil+B5Gi8+cNuGaFZ+6x7x
	F5uSj1L6u0xVrmlQtWMKsuiTA4ltgxYp4N7o3ZP0FWFalust2rlWRH5p8uz5XgdE
	A7IOQQiscH2IEJG0ZUUuc7z5pq0Y0br8MM+P6CcxbRr5nXE43drAbeKPAtzN0Wox
	D1w2MjlZ8qJGBoScYamCSWRlKlN8e6HlyHvIxt0LYBv4qxyKNUEa08imYSf4WpTG
	GnNiL/HEqez+F0/XPIlyLa4dxvoqSE4Cq+f/xADYG31epA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80hevmb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 17:56:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b3544bc7bso85536311cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 10:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774979772; x=1775584572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MCRugPqLYDDnJKePiagOBNR7ITOuQlv7yXrdfNsjxWg=;
        b=kUcRxXnslr8oKxf26FO/canKk0txdTlWn1IV4oQ9hvWxXkgKea0dtCKQm/hcQUmR+2
         Wio3HA9yguMM5kHI+dpzQN4faBvJOedDPS1N31qEHCfazB9MmtILj0eBJynZpn4Rqkg5
         qrkh+qjUbSVHdsWgR835f6t8Y8eLk2tYM2vqd6rUIRKM+qy7vGJKoC1jhfZEu9nz7WMZ
         5QpkktHfKQOrLOma4bdsQ0aomxERpdNMiztSDQDNZ4+oyGeotq6m1Rrcs+VoPkGcRRFg
         vGrP++rdFmKzn++uGXi6BMAXttStXS8il9TcOjP/FKYjickYwzzoh8C/XxHonkgzLDDb
         Xbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774979772; x=1775584572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCRugPqLYDDnJKePiagOBNR7ITOuQlv7yXrdfNsjxWg=;
        b=Ch4x1TjFy9YNbUJ9AJkVQ1oUaL3WIeMHJPAXJkVsCAzJYOsFkXFsXosCiuoiVcaJwL
         STrPBXAwLX93usfbn+5NmwRtoYkJFK5IWbAHYGK15NcpXmMHP4iCB7eqj1D8XsOW2prl
         w5jiGwea7WxiNaKzYMT0eG97zXnRkefLT6A8R95XNQrGmAA/Kcsac7vXZ10pLKuBslK6
         eYW3eApIjSxWfD7rkGoN6shYMLiNoOi83MZsc3si78/lf1iFbm8QiJ+0w0RlyoEZUt8B
         atY5O5d6hTYW60WWZedbfxWhGd2sGrkSGqXtXs4sbIxONLLMr4C4C/an+eClEx+F5oiW
         zwTw==
X-Forwarded-Encrypted: i=1; AJvYcCWIcipohYq4JUIxyt9FhHaHHaNek92Hr/jev0uju77nEqApfno8DuVlt70kA51LqPKgxi4z7QykzYjPkJ8H@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe/q5zvyciGDRUIrsc6ks1zHzg51Ly6CKRVp/nIGkjJdqpWLYc
	aHK5nJrw7+EP/96HWY302q4q23XMNIa/cAtesbpXwQiVvk2vHQHozcS0ohKSnP/vq73jxhP5+Lq
	4XnikdwhHj3zqaSGiDTILjb2FIE3Ixjof3urB3iLnoF6ldci5hXfLdNg2sEWhuR0pYXhksKCaix
	2U
X-Gm-Gg: ATEYQzwHc3Q1P8PdmU56vdKh6cfStz9Ni90tLtUUTXqgdbpMIjkrcApf366OlryfmC3
	LeZPojE7gsvXop0oYgDUxJNgXg0Hi5D1GvdlDbBexEhwYjfVStnXZj3rDg9b/YC+BUfqe58GsKr
	WvwDLrrJvL3UCGBjDZpJTKbLKn5F1xkBNXLodOZ2t2iXMYhCvFjvKL52nMk2Yc3JeMJHhFOfTv2
	UIa2VHJ1B6nDbzHWD+kotbPaLs4osSXLBhIWIegJznCwSnwRbJcaYPRQRGAtgZyDaiR6cX9vevh
	LZjgO3y4KViYxGWHTbDA3vZH4kvv6Q6og3p94qEc5NyqYMikBcN4McCVOtEN/opr1LC7mEiLdl8
	zXxK8Jey//VxtB25KFH1DU54QtHWgxpSXUFaC1LTsM+Ukf/JArd0PaG6puRDv4FaPaqK4rtZ+ur
	AMdHSrSXzN1GtCVi6Yo2FRvQ9H15HdTF2VH/Q=
X-Received: by 2002:ac8:7f4c:0:b0:50b:4e57:d3e0 with SMTP id d75a77b69052e-50d3bd95174mr7175841cf.59.1774979771820;
        Tue, 31 Mar 2026 10:56:11 -0700 (PDT)
X-Received: by 2002:ac8:7f4c:0:b0:50b:4e57:d3e0 with SMTP id d75a77b69052e-50d3bd95174mr7175441cf.59.1774979771353;
        Tue, 31 Mar 2026 10:56:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cc0b1a3c7sm1640311fa.36.2026.03.31.10.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 10:56:10 -0700 (PDT)
Date: Tue, 31 Mar 2026 20:56:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: eliza: Use Eliza-specific CWB array
Message-ID: <luo2sjt5wkgoqtym5nfhvvrup677wnzbdwjxafgj3wdigblb34@cbjhnco2rhbw>
References: <20260331161156.211623-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331161156.211623-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Gb0aXAXL c=1 sm=1 tr=0 ts=69cc0abc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=hKC7iyroczjhHUBRElgA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: WaWeb8aet7LuFJx1j1VNvIjfk_1kEgXk
X-Proofpoint-ORIG-GUID: WaWeb8aet7LuFJx1j1VNvIjfk_1kEgXk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3MiBTYWx0ZWRfX4mCXnyMryka9
 ivb8eS5DbO63meURgxc9FoBntbxXjEP03+WeHMIhBhNfIBpUDnw3c+Vy9M1hKB1N3QXHHjgkfOv
 P0EEb42807M4BsvBhIzhUWuVJBbMSQf4szstXFVVof0LBpYqBK5ssaqvBGFu1p5g+i8V6iev5Ur
 rVcf/CowmuQxeGxiosBW/VhUcONtontXG06ERDfw/zOl/21oUnYtXGsRFtSq/U18tDC/u0RisoO
 JepqIRxJU3gFrmmFo2Gu1tqn3ZkZq2aO2sJCiX7VjG0kTmWl1yhYaZcM6SrFZ7zy7XV+Fn+uaka
 Aej8nuj1STLoBz7CFdUgo9t8uxMbkAMLAUKVVEyFhuSONF7UhMpPGjKgAMLzw5g0sXO7Jg1BWkr
 FhKR/ixJ89T9vO9LFofw+iZOkSw2ORKxnBkM31XzixpklAY/jaPKUjUmwyjrytXCDGJPH9tYFxt
 4BVuxeIoPymLESkVrlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310172
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101109-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C51936FA6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 06:11:57PM +0200, Krzysztof Kozlowski wrote:
> The driver references CWB array from SM8650, but should use the Eliza
> specific, which has different register space sizes.  This should not
> have noticeable impact on function but is indeed confusing, since the
> Eliza table is used for .cwb_count.
> 
> Fixes: 0eb707bbc7fc ("drm/msm/dpu: Add support for Eliza SoC")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Fix for a patch in next.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

