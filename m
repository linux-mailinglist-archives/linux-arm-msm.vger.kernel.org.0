Return-Path: <linux-arm-msm+bounces-117893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tpBgBpBWT2rtegIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:06:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E8472E0F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:06:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DskLkMNd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZExMuMwW;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117893-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117893-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C3FA30734D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC53D3ACF0C;
	Thu,  9 Jul 2026 08:00:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8142D29C7
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:00:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584018; cv=none; b=r0m9HQbElMfSC3/OE4HoOTiWkaHmdcQI3Wtu5waZliOFzmtBaQYtHLpGlT8xFRAf/5eHLSUw/lnlwE7D8jARyxmuJrVX2uoiTg+tA4gY+YMjo53y2+wnJgU0TQZbRerhPGc4FZO4DwLhSLQmT/yde7U0iu2tmo4zBc49BAjC2Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584018; c=relaxed/simple;
	bh=6Lck5vnkQDlQUhg4DBtvah1Bk5n9VjtWTX+/GMT91eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h5zc0+BA/b3hXGUe2tIG6FVxTkDkBCrLXlgOmWuZgxpxpKmxSgK+LK02a1jTsS473CyafXim2rqfLtFcEhcrYoCGaDnw22EGAD/1y707bdN/IKaOe4ooVp86cOLIj+k2BdjjFbnUvTDZM8XhPZjKExWoy6jUU8Tg9yBCflaUxkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DskLkMNd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZExMuMwW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960H4M887963
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uMmpQEjGaTKml2KNT1Y7dXIp
	idktqGbKEdteaM96mzU=; b=DskLkMNdRM5m8582Cp8+Ya9V6RY+pWhqOedhTXUN
	DkSeDoT07r2BBh21l+QgB0c3M0OqnnpEPTHHeBGal3Ou7MD5yGVTIiRAVnd2X79Y
	YJXGYK/Z5nDch2Di92DZIkeKSk3CnMDuw/pplkSajfQrsR3iZgqEcWuNG2jTaRBH
	7spDMcUnG13Zfwp5tnVTxfP2WFN14m58JPmIP/hvGggjNcj+axRIcj7UedXL9LiI
	Vdot7gi+RiIp2bpEYpyZIWvE/sb5MHbaerqT+BjM70DAWbpsOuwz/G3O4b8XbngR
	+HNXzkb9SnTCfTQyTX1ynfZBgY7uwQVxU1lkfcXIa8FTLQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33e5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:00:15 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9691d185f5bso669764241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584015; x=1784188815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uMmpQEjGaTKml2KNT1Y7dXIpidktqGbKEdteaM96mzU=;
        b=ZExMuMwWkUJWJ/Z1uAQqLwr7eDxMULVQFy/H5Mr+FrGcDiv9h1YcHKWFLLeUFwjNiq
         MnzpgWtsNvbQ8h47nHbZjlHNtiCUqc+DRSDlar3AYDuVPfoAnHn5wsMcBdR+zesG06RW
         XqIx0p0DcgRvslgGBiA8g533+LXt7G0GMhws0OMvVtFCBUsZzKSi8mgskOAaWxao1pi4
         xEnYawkZmZ8ayuWFY51fQ1x1rYL2ZgvxeKMkj18rvCyk1POzdNHwE0ct7oD6KuaorFRm
         lG54y9TKtzcLwwKdiqzpZ0iOQoXWsbp8r9MFKgu3NRpZJX5YsJnbcaN7vx0Ez96Cs9ix
         mDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584015; x=1784188815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uMmpQEjGaTKml2KNT1Y7dXIpidktqGbKEdteaM96mzU=;
        b=NbGWZ58HuUBLZMbPRoDR9+0X4r05Ka1F7cg3kNrR/92WYe6FuRYl3d4lcBZGT8Cz+V
         TsShUTgGenMROSHB75A8DumBtGzkLdRBhVtUZjKG0PEqKiLL4ADD2ARv5f+oJNipEXqy
         /42rsEG9dGQSk4Uag/8EhVjDpvQ/9Opvhv+cyMG4Qex600WJVDX/zxbraBdlOtVYxQhB
         Bn/i6a4oIeeysQmxOnhaR+hsZG5unEcwwCqtWsd9K91cjCNnoGaudvtGt4MdXg07J234
         cWLxdByAyuKVnP0xwY9SImnXI2OzBVIiZEf7vGJ7G8a8zSAH9TXehoom3gLLWYFreZWu
         5dZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgAZpddPJOAMDxUYS+O+Rbyg2a1bCEuREC9rND3oNAgkR4HFkQTkKEDfbaGjGNG14/b1YXwOLKvmnT9u/E@vger.kernel.org
X-Gm-Message-State: AOJu0YwoxJqnqjeg1+m7XXKzHxz+2QSzJwD2kXMM+4/yqWUK/7RyxOPB
	HtUyjQzOICWP+EuQ8gFTArxUAP4cFSTY8JDlcl/bhB/XOuzwIRAvKjnUyx/MU0o84PWehd/7HIA
	nigAJkOjUsqjhjIBSUt8H+kX6e40ZnNOwiskcjm1hJu1bS10j32K5a8INIgwpGzvylERq
X-Gm-Gg: AfdE7clIwzOYrkcxLiMyzWtJdr3TTcO/dS0OSzDEKvvY4JHkTxwr+jyTo9N9zDwmQQD
	+IXqEhDgh/wqcbKpO8+laLeqxjLmhaWwsY/rVQfgyHacpThPG/EJz+pC4NGZyABlBsQvGzy90Pz
	mIGjAKZZUpZGd4HJ3GtjRifZbGvFvc8YyCWw0wuaUg8mOGD+5+N5aiW3xE0b5QLns2GT5RXS0vk
	WhH9wMmRA0LBHYLclP0Znw3hIFMtXcFQsRBGCSUaBB8V8Qn5rOtGqX+s9YpWXqfjUgK6u2VnsYc
	HWx1jWfM1rlJWtjYRESBrO7lNCKezJTLypojzraeIiTY4FDsoS/V3idSHd5T4UigNWKcu8/oPWo
	46vf+eHza8iuLnCddom66crCE6/Dl2EP3OGcietI+gTkW7malwhYEpxx1yQ2sCUSPtaZIfzZR9R
	Wi0CTC1uK0wDiu9dqNXOEIYLgG
X-Received: by 2002:a05:6102:1a0e:10b0:6c5:b556:6d50 with SMTP id ada2fe7eead31-744f6727359mr807949137.13.1783584015126;
        Thu, 09 Jul 2026 01:00:15 -0700 (PDT)
X-Received: by 2002:a05:6102:1a0e:10b0:6c5:b556:6d50 with SMTP id ada2fe7eead31-744f6727359mr807921137.13.1783584014696;
        Thu, 09 Jul 2026 01:00:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137705dsm5107062e87.32.2026.07.09.01.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:00:13 -0700 (PDT)
Date: Thu, 9 Jul 2026 11:00:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: unregister CAMCC_GDSC_CLK
Message-ID: <dy7lb5oxp4q3pig3hpa2c6ph63fbengmniuff6a2j6oyf5cust@3vzqk2w5pb34>
References: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
X-Proofpoint-ORIG-GUID: A1Y86IqTf5HHeNYImOypFA-6Q54eFG7M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NCBTYWx0ZWRfX2M1nVvVRZ4eT
 InYG7QkaP7nJCMqVFZwsnK+F4f8sqUh6/c3u+Y91NJFbmHp57gHbfAWh/K1WJNxE61F9B6UNzRI
 HsAIUJTjd3ilDvJ96mkDjfSBrNBKmuEYOBZePIdwRdWoPOy91s2H9m2QdfeaUti3yjZwFkBsjvT
 JLdkC/F9CA1MPN1XyVCNBQwbxDbVznnU3JVMA7Qbftc3DLDJYfAzCwJGgSj/wR5XWx66HWDRlb7
 FZJj1yM0nE38ZRYXcHRv7ykB4fpNuqaaSrV/DdJnlSgNUjUAhcabz9kafLc+iBE6NW4/lRjV1ua
 p2Y9zu1JmZBEOsQylYe4YUxifdIx7eL94uLII14rom+KDsEtVI9lfJLy4jMSRHN1rPzMkdeBgIm
 1sNVlUMHRYVe7KecXOFdRN4g7iUTEylFQQr6po5yP3qjnNXx9H0ShA3mYLkm7xcphLhWSOjB88I
 wMWRdONIgxyGE/pC0cg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NCBTYWx0ZWRfX4Ysxa1NwRRUw
 pVeFneEFRjQb3XcENlYpdSvz9Y5lGHD0TAOYmd697Tl6zi2XWwdICYhLOyy0sWzpaWH1+nOBaEa
 kjLK3ou81H4QVC8aOBEBka1CaOkGZQI=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f550f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VuFW3N86aykZV0Cky-kA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: A1Y86IqTf5HHeNYImOypFA-6Q54eFG7M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117893-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,3vzqk2w5pb34:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jagadeesh.kona@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1E8472E0F9

On Wed, Jul 08, 2026 at 06:30:06PM -0400, Brian Masney wrote:
> With the introduction of sync_state support in the clk and pmdomain
> subsystems, the following warning happens when the unused clocks are
> shutdown in camcc-sc8280xp:
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

