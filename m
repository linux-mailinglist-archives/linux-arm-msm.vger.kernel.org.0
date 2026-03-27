Return-Path: <linux-arm-msm+bounces-100449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MNiFMbgxmnAPgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:55:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4872034A855
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30EFF308ACB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276D8391504;
	Fri, 27 Mar 2026 19:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WeU+Jr5C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4KVsdp/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA50386434
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774640913; cv=none; b=Z7H50LO8jHv8AfqbjL9V9lBsX1nRKb130aXiK0LIgpycD5p9ivM5B8oXPr8/JdtkijvFGLUaNTlKVCyBY8tAliUzUKFVyIsVTgoJJEqtbEWuAm2H9wPQjY7dk3200swoXuQqnXzJ5tvCS0Aj/XMwb3K3acGWImfTM4H5+DgxRFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774640913; c=relaxed/simple;
	bh=Evucs/+H9yuO/9AVOaRDwEBFAiIb5xrrZT9lhE9XmVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ep+PQHQeh85Y85Xb9DimmF+q54Zbksy0nZ5plkVPJh3T9DIPi+avjaFPAlnY0roo709zhlQTa0OTl9KLGADL4LecAXaWy9k+ZPaZ+SegA9ZaUiHM2DymhLIqkEG9VSTIP1S3Xpig5Rryk4NpbIYX8bkBTMSqAqEe/RQC2Vwb5eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WeU+Jr5C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4KVsdp/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2uTq1775544
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xUya3rDnbfXOwBBfrr+GJsatb9QGfOZ/NoUziq/dZs=; b=WeU+Jr5CCpWN1psa
	yn+bxLiER11kOE90BLtlRpqQd9OLYd3sRP/bL4BafkK0D61mwdD92OriGNGHKOnc
	VMRMQYXO4ZQiPbnANGFDZ5I7i9++B4/rL0Dhld33nzwZY/lNH1ahw3ejoIeDiTe1
	/DZuUhelpijWq1Jbfd2Yz69nZ/aItfUSZYoifUgfEooXq482lnm+pRo2mJh5W1N0
	HZyOH8L0sc2rqhBU8Tntc1ip7bANB+h97yO0Y6VxqZV9rtOCfNDJkmtUJGs5V+sT
	4idInldFE0GgJqo8izrTDzSVLNqqDV7PUORFF6+OqzlJuwYlCATRUP6WJKGlJYhc
	oDNJxQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5vvv8rf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:48:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093787e2fdso116559641cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774640910; x=1775245710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xUya3rDnbfXOwBBfrr+GJsatb9QGfOZ/NoUziq/dZs=;
        b=P4KVsdp/TXKhaej9piTk15tTtZ/64uS8YdaXrSw9ls0GHb8uuNyUQ0PICQXydaKtRw
         zd9TolQevIoO45+DOQzZ6mYRwioj+HCslTeHU8Wzej4uKg/euvg44Ct5f1mRYSTxJyur
         iGF7gUUPXL2Yw0BfpYBXhvcz4UKpgIKg96UkxgtPrBvDpqa6HQawnNhsbwFkeH7txDI5
         b6mAcuAhupIE1x8Nb818d2AASBEGgjBxYUm3QIFOBUIb+KxAYXE2QGespZpR+W5mxKAZ
         Neei3qNEQ3o7XUMtI64JdrXPWIXBD0x2wSnHOC3shNBhAk6S9CDbhHBM6TI7mr5yIOyZ
         i2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774640910; x=1775245710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9xUya3rDnbfXOwBBfrr+GJsatb9QGfOZ/NoUziq/dZs=;
        b=p4k9xIqsGYrADgbMEpyOy3h8lGLuKDi9cg8IURAGoJaL4P94uA0FA4HTkTkB4olHBl
         NHK62IVDkiBLWON1HE1fQyGAOhoMyXFZiPb9JKDM3N/H9KTM4r51dvCXxzUcB8rmOssP
         r+Aa6lYmqQ/zy+T0od2VOwfiNrq2jN6FgpyfktSkbHhNyRnnjL+weeoKH6V/tsPRVyvO
         8859Er02/VH4+/2ijsrIlg1kkI8nvmLIYxdK4RQdH4mzslqg/BjmDiU4ETYE62bUetjp
         cotR5kNI9pw2MpfdVc5VsaY6YCxW94ViMHFl5msnZ8ratD2mrzOHHVh0EUIB6m/2GtR6
         PLRA==
X-Gm-Message-State: AOJu0YyJ695MskaF4lx1xoPRhDRkuESANNVcuMU7STBuZeug3UgVvMeS
	xJhm4LE5D5dK2oa6mr+OY87bgtz0KmnBQ3ELNG0L3A/A+lJV1b4S6Bluv4vlIvxi7mGEnQViBfo
	0uJOVoZxhvXny1N4Q3/0SthE7ETmZn7CgbLf7pTkXhxzJ0SolutnmlWYQ3pytUwJrkJ54
X-Gm-Gg: ATEYQzws0w1NZCCabGuMkugbPNRMcz3Z1BeB9DWoLebDQT0u/BIlAJbNqo7TxxNLkqZ
	4aiBBvWOOuBmDgl4KtOGtrj9aTDAcznjHg+zxg4f5Fi20WPz8Pq/20MwpUmsGrf5FOiuqe3iU71
	cLupdmC9gHwtZRBpjyuRde48Ea+MAzPG5O++FYvBhGuoF5dNJBX9fO1waKAKm0wko3sBN7WIOmK
	yw3s740Q4YXof9NDY5WDoZ/Sg7GAsViqwGtAKGkDjk026sIzSPMXjHDc7hg4Lnnd+ng/ZlV6qBC
	R6k4b+eOqprL6HFt6YgBgn1XC65o2TTsowKyWEL1ffvogmc+pfLfkNsSxMOI3qZxvdkH03Xc8wn
	DKEcq8GSI7b21ZnsPjE+2MQ5WXAt9eXgZBEs/53bioxDFNBkL80ver/EHr0P/fAaz+EmUm+IqSG
	+Smv47G5QhhlhXaZX34ZseOuGwTyGXIzXG
X-Received: by 2002:ac8:5acd:0:b0:509:2527:d789 with SMTP id d75a77b69052e-50ba37d1d6cmr55045411cf.6.1774640909940;
        Fri, 27 Mar 2026 12:48:29 -0700 (PDT)
X-Received: by 2002:ac8:5acd:0:b0:509:2527:d789 with SMTP id d75a77b69052e-50ba37d1d6cmr55044901cf.6.1774640909485;
        Fri, 27 Mar 2026 12:48:29 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c837130basm275211fa.12.2026.03.27.12.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:48:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, konrad.dybcio@oss.qualcomm.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 0/2] drm/msm: fix mismatch between power and frequency
Date: Fri, 27 Mar 2026 21:47:55 +0200
Message-ID: <177463970812.3488980.1593803967421467214.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
References: <20260109083808.1047-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oIylekWdXmnhwK2CcU4PfwNrWDQW9PYA
X-Proofpoint-GUID: oIylekWdXmnhwK2CcU4PfwNrWDQW9PYA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzOCBTYWx0ZWRfX9Ly4pXssisMU
 R+e2wAWzy3fzM7rwqSD6oSURGiRGdTspiJU83ebecSX02sXlENHnlC7qA5Kv8JEnysiRH65I+ha
 GeYjyfSYzW3DpBRUs2tvKcN0toZZEE2CEGWJv4iCQtbkiNEIUTDHb0hn1ZbvC4GsLcpYIAanusv
 eGpfzLM4MOUfm7Wx/lhRtFApSB6TvSYJcc4hbzqNQJIXQW8IFyc1YSDi9bV8Q2BU5/Gj5V2dyAF
 CxETO6FYUkr0RKrVHce8qA2uRndvyuKNF+j212b9A/Wv9j7mGOupCYVFb8UAUFUjYOr1GnnrUjp
 b1tVbByGL/4rpAeAb5/TcN0w11QeqggrwhUBDw0jFAgu54MnEjup/T6Zd8PI1gxWF+LFp3m+TAm
 3xHL9aXHV112f6drXBrRm4FzhYxVzwfugHGOTAGOFDvcvYXoIxm58pRmkUBYMWX0sFACFSax2XS
 6t99Wl+YF4IWxqbC8vA==
X-Authority-Analysis: v=2.4 cv=PL0COPqC c=1 sm=1 tr=0 ts=69c6df0e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=5-8HcrL-3tWewVUv8uQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270138
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100449-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4872034A855
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 09 Jan 2026 16:38:06 +0800, yuanjie yang wrote:
> During DPU runtime suspend, calling dev_pm_opp_set_rate(dev, 0) drops
> the MMCX rail to MIN_SVS while the core clock frequency remains at its
> original (highest) rate. When runtime resume re-enables the clock, this
> may result in a mismatch between the rail voltage and the clock rate.

Applied to msm-next, thanks!

[1/2] drm/msm/dpu: fix mismatch between power and frequency
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bc1dccc518cc

Best regards,
-- 
With best wishes
Dmitry



