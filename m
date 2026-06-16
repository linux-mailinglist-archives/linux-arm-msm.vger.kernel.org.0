Return-Path: <linux-arm-msm+bounces-113281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8Ih8LyeUMGqtUgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:09:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABEC68AD03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:09:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PvbfC8V4;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YWEYHvuR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113281-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113281-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64AD331796F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C008B17555;
	Tue, 16 Jun 2026 00:05:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD1B78C9C
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:05:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568304; cv=none; b=iprkoChqWm2eHmzb0zOCm7XPajuIVl41Oz1vedN609RfYRvxkTU1IwuxxwQeuoF7h+HiAEqYmbE5MJQ5Htc251HHjvm6IwHNekP5tltmev5swwvuEViiX557YlqnxlyLyViDIaCRnXj8C0ftqAW555Y/6kMAzib53TmpM+9M0hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568304; c=relaxed/simple;
	bh=+Z5rBkgfi7IwcRuoWGZOUS606iHRju+ESdKBNL5RkTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9Z/fhUY3+UrL+0k6Rc7NZtaYJs8ensLSI+NTRxuZJjuqziNzCo277PcphOdGfhyuVpQCZchOxWkvuwQnrh9gvM9Nojje6D/lU6NzpDS3gsChyk5UWYKumP17QX5OOM46kqJfRAV3eKiK54cL2/hU8CJliQz3qlgQDuWk76zHkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PvbfC8V4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWEYHvuR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx6hL860994
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7dNNWLjoL73Wgtu4gxCh26z70OXEkNFEiHQmOGKik4I=; b=PvbfC8V41HYOmj2b
	8dzeZmvMSxLgBHpkLIhKUwh8ud/KHQ5rPIVZAdSJpIjpBc6GTHJI+UTsM0V2b6gP
	uwd2wN3S7UnkUa8zETGE902okz0xeeUB6weSDKt7tb8CenMCDx/OGsttGKesMbSl
	HzgHV66g2f2I1jb9AQc+GpYbhTfWYeWjdCBjxJlSK8aPdPInVGDf9WVjfMRkMErz
	X3t4n+PfDNJWemdJoKADR9+m1U+PopSKX3EHPr2pCXe/i4R9Q6rvbFsyqToEWCxF
	EXYX78Bzc9K7ns2ufVw9t3psl/Zn9NkMH00b1BzghHo65EfD+2Wefx6S4iwnuz7Z
	KF8oyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydbmqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:05:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915b9dd020cso1010338085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568301; x=1782173101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dNNWLjoL73Wgtu4gxCh26z70OXEkNFEiHQmOGKik4I=;
        b=YWEYHvuR1JAZjTKLS8+ZF4UOFPklejf85m9ZYmH2yENT/RSmu33ysxaCE/vBSyGQcW
         cC4EqLA+re/sO1QroRtGZxMjhHqaDScAgol5ZH+JjkvJGnxNDdKmh7duM6VTzDm6oHad
         PH7tSDN5bHufIvx3tqrLfsBOGoy5dQYZnQzpEcGsYmEyMqFwJeJC6pkNL9MCxmNcuK38
         pHR9UsoFOZwQZM/vidUfRHUJKHiwWXY2y1NJXrz1Wr+IIiit6C1dBeYfVTnpmxt+E3g1
         2opgmr5pdJ5xLs8ReGp0a1hvJeW4TSqHBlFzavCZOrKmYMceSCW8bCNcy4D74XIAgik0
         /OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568301; x=1782173101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7dNNWLjoL73Wgtu4gxCh26z70OXEkNFEiHQmOGKik4I=;
        b=tOESGsLl/SwmbNwe9JfmS54vaePNCcXsGCujWIfCdi7Dd43wroTNLdvWIHU2z/pDmO
         uEilajfaOQHPvWzGEmcPD9pucTihxTmJc9WYYQxdOyvju7iM2btK83DtshYVKKTzatMP
         TpDzDxwZupdOub9smyFlG7LMwwocVTcz4sZlWmF+V4sL9ZG3b8XBvYeU8PFKl2aALPxq
         xcolpJJMOpPGZwxcYLZQtn/duylytVcJAOpYLsV9gh0iTJyhppznb5bObdhRd2R6LIkx
         dhEQv+LLjsmVts39u+sEICpLhiCn5f2lGTPfwX9ICHpfNU8fPdw1uU+fznTclAnvUVRl
         10lg==
X-Forwarded-Encrypted: i=1; AFNElJ9R209aY2Oyri6IeB3OdQoblDIPeS3ufecI4yr3rZOSj7xrIXtGclYXK1MVwwvwgfoctiGu0a35yrK/LaZY@vger.kernel.org
X-Gm-Message-State: AOJu0YxwTOBc9rbr3DqpZGpfgYdsoamjcKgcwoKkd1SyEIEkqPm/+2An
	WKhl5Y0Q1Nfl5jirgrtDZLj0k62mcwvHXcDIIeM2qX0k2eOAOemJRNdzciDd2BB5XrUHvmbJSpe
	RV8cEhU4+lk3URuU63jVJKgjMtCYz7gZsmztKFgOGi+0t0/D6Hv7D4qxl0eN9dsHXKRQV
X-Gm-Gg: Acq92OEzRd04uwvPj/pa7zqfRA6CgvjVPqcsJ2BNSOKkgWa+baIzI10zUwkmoSeV3Wh
	bJrNRGLpXntaQvb4hHB2GTwYnc70PBCBr/HiQw4GRkzovOXOL/b2CR33Hmy35vJvRaj94SVNVDq
	Ex+av80jOymjCp8chy5aoJCvE9mFdaZ4FJ5cPNoSiPr+YlygQB4O1b2s64+rp/YT0sefqoSuWVr
	wrVtFOHTHqlLzOfWCMhDBiBLDaIsWpcGNaTwoiK4QrlX7JZfopypzBC4MinbV6i7nrkFo+00gep
	wit7R43qfh/yHl4YuIQYowNhk+w46H77Vl+n+LG73RRT1COkDn6hnZvNBxBGWVmkqDV1VbC06dY
	5CbjacMf8xXCXkmSGzbsCUca4PRmm2g3l0iPA7anVmM8hIuWgz881djoBa0HPOyrBcN+UlkSRex
	GV0CXy/hOhXcWhw0ZSHLfrL0fZwBtPp5ajTaE=
X-Received: by 2002:a05:620a:2984:b0:915:8055:3f91 with SMTP id af79cd13be357-917f1f4bd4dmr1972932985a.43.1781568301529;
        Mon, 15 Jun 2026 17:05:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2984:b0:915:8055:3f91 with SMTP id af79cd13be357-917f1f4bd4dmr1972927385a.43.1781568300966;
        Mon, 15 Jun 2026 17:05:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:04:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:33 +0300
Subject: [PATCH v5 06/16] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-6-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6946;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AJFs3OudyuZVurF6CXPv4L/hKHLI2q1ug8aHEJrRBk4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMOtFFKn3Gk8q3r1GPmozoFOIWr7mSKtbmNS
 Jlxjkpt71CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDgAKCRCLPIo+Aiko
 1RMYB/4ifAOK6LvptRsRn0YV0KuNuvYytHJ/Oq3Jh2aBS/RVs2Cb0DWqnmnWytzvYTakL7UvICQ
 a69ho8YoudM0PI6X2muzHU9J1Gq9L+3J5QVXNbZ4BoUbJ3Y47h459v81um5MDQB6H+6o6jw7Zw9
 v08a1h/GFzmxOPkGg0sHXCh+RJ6yRFuDdSIm8LY9n/hZXX23C02nAKMZ3bM1l75g/2SLqLMN9G1
 yqnU5h3SpwR05XpGHgQqxavFiS/ZVJerf9Tm55DznaQgj4Ey/Q2fZNshMWzZiTsPYqw/FjMhzXj
 aF3C8equN+008+VD3b0IJ+TyP14w1IPLCHx6ZvrGJyyNyr2h
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: FhdErqXNwPep8l8D3yluihMivvYZAdZE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX1ppuSDeCZAgp
 fbRdCKkFWqHeoUNjf0gVDAFzk+qdMgqMUCj0OitOyd6jCBTkyt0A1/JtmPhJSyEaSy+r8/nbAAw
 F0Dz5Zv80/4lcd5eZt+xuXrfbJAyLO4=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a30932e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: FhdErqXNwPep8l8D3yluihMivvYZAdZE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX0E59yFpSRXW8
 hbILT6oF46WEod/OH6NBqRmE5Og1ggRbRkNIO+G8bTk2iISA2WCqca/t+SCwwdkSAJds7rl7sP6
 gwYBu3tbXXTpgkV0ax5S7lq18CLrRwhls0MlFavKocv0oYa6jg2fL9FqiefSjJbC+PGCEGtsA9y
 8t/RfWJfG6RH/Yqr6BRWAgE2t0PyS+VHpBn9EEb4z/Df560dTuU+zvOAWGs+C/+PRcNrZP/FRks
 SVywhF2pVrxDzAUXT87DxRY+7/aJXj1fvpt1WXLBMCxUcEfFLq5YBp+yiYyuUZcNIME59RpsFcP
 CuvCE+sOYOfC4CLOsda2cP/4ESD2KoZQEFEBovT7vJ2vGWrRw4uJvZnv+CghaLx0U853IVNqH58
 cXl9I5/8i6xjpuU2eZSTqvDj3jKfTuWY7XjyeTQEUCkvkfsQC8NUPCKr44AHCm/uavyEe4MxVYM
 qYsjfOtro5L8U9HRjpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150254
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113281-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1ABEC68AD03

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
from the currently supported VPUs. In preparation for adding AR50LT
support in subsequent patches, introduce a platform data field,
wd_intr_mask, to capture the watchdog interrupt bitmask per platform.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 7 +++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
 5 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 55a4fa356985..81fcb2854772 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -315,6 +315,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	u32 wd_intr_mask;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 961dce2e6aa9..eeef453c583f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,8 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -94,6 +96,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -124,6 +127,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 74626b35d9cb..6cde94d86408 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -18,6 +18,8 @@
 #include "iris_platform_sm8750.h"
 #include "iris_platform_x1p42100.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -113,6 +115,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -142,6 +145,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -179,6 +183,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -208,6 +213,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -243,6 +249,7 @@ const struct iris_platform_data x1p42100_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 375bcd923476..41498f94480e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -109,11 +109,11 @@ void iris_vpu_raise_interrupt(struct iris_core *core)
 
 void iris_vpu_clear_interrupt(struct iris_core *core)
 {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
 	u32 intr_status, mask;
 
 	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
-	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
-		WRAPPER_INTR_STATUS_A2HWD_BMSK |
+	mask = (WRAPPER_INTR_STATUS_A2H_BMSK | wd_intr_mask |
 		CTRL_INIT_IDLE_MSG_BMSK);
 
 	if (intr_status & mask)
@@ -124,7 +124,9 @@ void iris_vpu_clear_interrupt(struct iris_core *core)
 
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
 {
-	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
+
+	if (intr_status & wd_intr_mask) {
 		dev_err(core->dev, "received watchdog interrupt\n");
 		return -ETIME;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..4fffa094c52f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -41,7 +41,6 @@
 #define MSK_CORE_POWER_ON			BIT(1)
 
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
-#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
 
 #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

-- 
2.47.3


