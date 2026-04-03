Return-Path: <linux-arm-msm+bounces-101723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBTpG3oa0Gl33QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:52:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9EA397E7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4257E304AC2A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 19:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 105A435F165;
	Fri,  3 Apr 2026 19:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jW7DJwnZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZOtmEVCF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17532C11D6
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 19:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775245786; cv=none; b=QOP6AJ3MK0QAmNXwCuOLDGf6JStc7KWL0YH/z+nsjCTzS9Xz9YJyNXjdk4io/aZo2Ms/rlnlKjFz3R9XGiYSKIIwO+kW76P53rtw6i8JaxkGY4NPF6su+MPmliNIngsMQjxvyoS+i0U50onrGBudWT1lqqpA0HiJo0BWxQ7Y74M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775245786; c=relaxed/simple;
	bh=kSzjHpVBgLkoQBFCrkMSJ9P4sxEwpcm0MFAoPP7mSJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H8s4igkBAqYOkXic9u25WzB46w1yugLh2+57k8s6f3NGwrleOk07d4rKkfbe9OyzUG5mfCkCJ9FNDEAoHAGerZ7T+u8g6lrHhV4tD8kszX4YtZzdc1sP57OIsT2O4EEWY9nOcRDFFT4l0nXMPtu/y2CZx3Gxbzld5Qj+nrTc5CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jW7DJwnZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZOtmEVCF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EKTnc142252
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 19:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B2Xxeuk464L395VDBZXO8f8G
	/3v748w3PxBnfz1YgrE=; b=jW7DJwnZ07QJQMTGtgh2KZgVTo/deEGkwqB5azNu
	GskyDhnnyp+KMwmRqAYlXuzAj7hzKxuXwBz6N59Z6mirxJPeCMsiG1UycqhnmPsd
	ThtCaDXotLdZV1HgCkvdKSPESPem/KGBBGOOSGvbEOPlE9wdU/eOum5u5FICjYnG
	NQlnrq5pjHzBa1UKiuDVkUjoG4PHGosdTQKleHuHR8KVVH7xKCoJjP2iR5Jd1SOb
	NkAARCKMM7xdepK1bdl6ELW6ReK+6S4GXc22nh6ujvx3yIRNSYsX/zkTkW1Eai77
	tiLs98IsHBYEI4c9FGcvu+LuGEb8Xdl0SkuLmXYvBTzzPw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y26r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 19:49:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5aa81907so45250711cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 12:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775245783; x=1775850583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B2Xxeuk464L395VDBZXO8f8G/3v748w3PxBnfz1YgrE=;
        b=ZOtmEVCFiT2il4xmRzNDctj397+cSUoM+ySxufmeaN8t0XI6b2SiwgMpk2iFHVG7P4
         jm0uet2tl0c07t5IdPaJ43dAP24QcH0WXTZMwMC9H+vxJJMnoIN02uun382OwIIiGdbL
         wzXwllSySAdf6DSKTINPG+WKQyXDcc9JBA0oLBt7vkj2jfXR9sOtIubacH61h5LNKn0x
         W0KcpR49r7I0E/EMYzBv0bx3aUfGgJz+ZRVhoXWJTeoY+pa7sj9U57oY7Q6eBWevWOPI
         BKVvlAoRg90uHuBLzA7IRfgLBouASUzW0AiLUXbRZM3y091FjJsmEQbYJWd61wI8+e5p
         XV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775245783; x=1775850583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2Xxeuk464L395VDBZXO8f8G/3v748w3PxBnfz1YgrE=;
        b=mVakB4qCHUXjW+9j1PetRAdoivQjUwnwGYL3hpbToyijuxkB5RZLQ3OMpPnGfWFGK4
         MujJMeobmmwJV+FH7Le0eNv1/npm4v/okaIY8gVyCfkSgi/aOKkWY9lhgfGLu3s6K1h7
         yS0yWWvQ8Bq9ZN8anBsTFQfW2AVhYCndPuX3+yfixqnt2D2smZdH60zmIFgYCQ5e5HmA
         geEyh+FqyiGScOo6kZ9Q8FnhdJ0O6vqFlY0pss7ZBY+lZCnhdH3dRHPM7uoNWWPiSfji
         L/Vicixytgu8p3bZonFTfc9QYnl5FtX8caZbmdrR04HMBzpQRQ872qY0iGue/pN3263b
         GTMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJWipoAYpQKXAZoV6mAwNtuLnzLuElZLndvTOBCxStJpQgJTWyGcm18KKRp+A0jhvG9toh7yxrUCCfKoT4@vger.kernel.org
X-Gm-Message-State: AOJu0YxAG3E2YNyBitj0dMlw0GiV75sTyVQSSknDoO+EcbwQg5a8Qu6C
	z32aSJK03qM+iAVw9r+WSiTeYuiSj9J0idPdSNx9dVIadmitpYvzHxLgXOa7GU0vu8uNyPtr8fi
	uNkkGnccMksDz3i4Kgs0RluM1PhO4pPnV8zCVXUWWrRtHNMiWaFtCh1ALycg2SrFdc0YsfNZ00I
	Ag
X-Gm-Gg: ATEYQzxYDYUWRoYm42dntIK5Aq2cuqd7dWWetdhYJzhrBeaZisSU4bEnCxtSBgWmmeN
	MtxjUlwzxUboVi1IGu1dTC6EOs6wJKZFe3P+GjE07iHgAunaBYTVbN/ZKbbSjDrTNva93g6qrEH
	nqPKsPs19i/4ja4aLcOi3imIJqJ98Xkdt1QZ0XbwmYHXfgwwuBJPNjqLozPfB4OM+Od+9Wg2zF9
	LsyD41g9UxYdKMhE/ecn1AAraTK9Rwo+tGAHmcBj/UjYWnwBFMLbI2YaBQs9POOxBD7kJnmtO1Z
	46w5belotEBPkCRAJM2mDyMrOtiZ//N8SA8auNM8AsNbNh+jZam91Um11ddQGa5wz0S7KQQZiF2
	eME+EAS+sTzkMx8/z3a43RPl9KvCBfISSCHu1UsZYbfSVuSuXH3tepG9/8YZzQtYbR8/hwA4MTB
	2RVq+Y9afAYuf8UYIjLseGqpDXndYtR0drxI8=
X-Received: by 2002:a05:622a:588b:b0:509:473e:2a12 with SMTP id d75a77b69052e-50d62afdac2mr57917661cf.48.1775245782822;
        Fri, 03 Apr 2026 12:49:42 -0700 (PDT)
X-Received: by 2002:a05:622a:588b:b0:509:473e:2a12 with SMTP id d75a77b69052e-50d62afdac2mr57917481cf.48.1775245782385;
        Fri, 03 Apr 2026 12:49:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6ca32ccsm1652397e87.37.2026.04.03.12.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:49:41 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:49:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Add ADSP FastRPC node
Message-ID: <qqtlbvkozwcyootbnuygfazrdaevzb3wh3mrnd2igs5wyyiv5q@g4lzdyhsvwo5>
References: <20260403120753.105869-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403120753.105869-1-mitltlatltl@gmail.com>
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69d019d8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=7XC-JGpFEoj-ohNN7HkA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: JfMSEq0OepcTKDh2ngKPylwQXWBQyGIH
X-Proofpoint-GUID: JfMSEq0OepcTKDh2ngKPylwQXWBQyGIH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NiBTYWx0ZWRfX2ntpN3Fnv5wm
 IHE4vksHlYKOJQ/kP0+2unexyHKB7grsTHlywTbbvjbjXREOLuchDRFIMtJZRQim8zkIRhfSrst
 RyovZ6VnI8LBherU45OwF+LSzblayMER7aIH7J1JJPmk3Zg+VHJkVN2rz3UzdakenQtABjrVaCE
 TOmIEgdLEkkEUHCCvTT9VAw/bjsRcdE8oVOuaEK8jQf4xYBGYVAwGwj/a2O6XzYuLejqIYhcR40
 aPr6Wfxn7u9JOTamLGKx1iBBZJm+9vG5OkW1AG44OLnQOmiz0OwiJ76rJN3515KbIfzfN1yn868
 4DrRXhKBeUbqA3nlCyVMkOIWYiNVZ/Y50zW94Roqqd4/aVVYzIflB26INsXDNiOBkn6Oag485cU
 V+Lw/eATQ/BOfSnZWmHmNoZvZXvzlB3RepEXEwHX5MsHZoiM6wgBcyaAMkAwEp39TZ8pISs5Lvk
 83fLNVQ+EZFjltXtR2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030176
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101723-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC9EA397E7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 08:07:52PM +0800, Pengyu Luo wrote:
> Add the FastRPC node to enable offloading compute tasks to the ADSP
> via the FastRPC framework.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 27 ++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

