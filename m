Return-Path: <linux-arm-msm+bounces-117034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8ZFGEeEYTGpogQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:06:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7182715A02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 23:06:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P9Jj8TM6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ehkAingf;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117034-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117034-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B74E63019C99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 21:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE852394EBA;
	Mon,  6 Jul 2026 21:05:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEF9355F2A
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 21:05:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783371939; cv=none; b=rTUKeUmpL5hhCInJvxVp9qtytJqUI7FEdusXaFMT3p0/2svTWnydEItpO0pH12a0HZ57geSGuPkVSRJKlmWZnOSyfHGnw2iB/ibQm7jCYxaZg6A2PkMg9Awt+HmNQ4dA6ImOrAYUonEWkTjhtneNgLH+yPQsnH7krMWLJtpAJyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783371939; c=relaxed/simple;
	bh=yGsij9VKWI7rB/vT0J8nK7LauF77nPjz0MJTy7VKUkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qb0YUu52pNKLtXQrHib/DvcJiPjhtOeJ9eVorHOqNiqDxDKW/4IczNff6gLThXGGOtJ58YUuGjUTHX0qDmUAfN8v7HKB4ernDFvSZFgNjToMeEoKk1W9Zk0iQ60UP/Df33sC8Bebh8GtNSmASYVTZVwzGZLX0OyAIXKUzLcXYqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9Jj8TM6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehkAingf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE90I1654925
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 21:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=; b=P9Jj8TM6cAcq3H7r
	wjqj6sSGBm4x3syZlkv6YdPpN+WR7zgnw8sn8rttUqC8w+Ux5lTJdlrWiOwLZX60
	soJUYBVsW1d5qsqErak8xliv9nP4I8vAD1rIpJIuNhCyPGc9Brsy8UORhWme5eFt
	cjV2JXrvgTo+VOMZUQkf6VWG0ZWG2W6ZLDWGCx5C8pUYiYY2qsTASxr0pqN53xxh
	EAsijqCklh8y9tobAaph0fesmhXZeKYNeRpUybL8eGSWyxeD9Yl/VTnFccc3ZmvD
	jm3ONgl0G53kRZR9UK5x7XfLhyHivpPsOyBPqM8pmanF7CZFYvyqTpQIVK3jpED7
	wGIoUA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpjy1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:05:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88da04b719so2738152a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371936; x=1783976736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=ehkAingfmWEh6LT7/Xf+mMh1t0ZUuWkVhblm8J+sf315NHruQdAygK0sen/JbgEcRV
         NvTe8SXPPJODzIyDVhj59X1Zr2aDkOSY1iB1WSPz84DKTv1TbFswCD/XgCQG9QwypA7x
         N3k2Q2PIoqFdFAPxct0i/qkHGopD+M3z2sR7IuUduPGblyCdzFdzeYtHOhYSsrVrpEH8
         AusKNuknzo7sng2kiJ5mllQFAjjTutKe60PD3aKZUG3mpX6KOVvNniWn1yr7TiVYBOLy
         crPY/D+OZKIdz7LN9hCSTNvktZ5UaAjHbmwP8OP2wDVKjpzVEDYBO5HHuh/7aKln+S+R
         G2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371936; x=1783976736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=YdG50KxUgIck1FL8iMrmAm6NOLxtkD6VK4b7FRoIG+L0KUkyKwU4JGUvg6n/caN4zm
         kWQD7BkNeOYNtimsFYE93cfZcunq9JH4jF/+gZTpjrlDFZ0qvUg8/leXH/52+gwiBUH8
         yDGVQpICvA9i5S8iCsW4RxmjTsw8KP1bhXLCoEzw1eTJ1PvgeqqA562xIRULzCEhjTev
         jpp7Nb9gwJ9EiUc6ESUBhjveR9+sFfT+tTWeVfKM37l4UQ/+k49mBMjw+gT/Y77B9hS9
         Ud93iDH+oMPtryd1nHFnDAEEreutgxxl2/N4LIeNwr99/pf4FO3RVy5j3+7vadfUg49G
         qIBw==
X-Forwarded-Encrypted: i=1; AHgh+Rq02/oLndyd0sP+R6SKZgWY4ZlX/uIgpn7tnc+X7sactlDwXlGArDtDv8Abzrr2uH7FnFBo5skkIYWDBtuc@vger.kernel.org
X-Gm-Message-State: AOJu0YxbNysfPF6V6WDb4uFwb4NlQV/Ddz4XRzCDVadAvxwJD0hFIKRT
	2fOA2HEVuaGdS2MM/d/p6fykGdVKrXaynweLLXOVH9UMaD2WTvxdGTEvtmi967LzuqoevNFTf/s
	AUnpObLWIyKx7+19X5+raMONGpDDOtFlnfnjB2GnlpjjwlcNle3Hc33YcxdSYuZgtm7Z3
X-Gm-Gg: AfdE7clrjBvHZ/hgEVRNzPg9xfwOq1XtYiWY9W7Y6cepqO3/tTiv5y2A6alZec7nScq
	qZcAMRllSeq9acii+SlXtEMmaiOf5pz6sfc+CwiGnPJaHPTylqsU34yVub9Fd1ch/wQEBOzxOuI
	IVKCG75qGWC867MRCan9N9pzLUnMOx5v0VCDi5/ly4zzFKoR4+uanI1j4S77em254zvLTLTxqnt
	kq/oiAQFJC6yZMwsH9DjNVeVFkGEdB4Tkaq0J4OOp+VZ5LBKJ+r0MfplT5VFLvXPffpYI55YTC4
	5k7dqfNg+qhZsVoinp7mErsUpXRy4MLVu5uwzMc+wYbQ0TDPzbpRUz5ARhj0kcXVHR0RYPXHVFu
	OObhTC5qQYlpKwvb/z8wV/ObPDOzYPr1V4B0=
X-Received: by 2002:a05:6a20:6a07:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c08ed5762amr2779200637.15.1783371936174;
        Mon, 06 Jul 2026 14:05:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a07:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c08ed5762amr2779159637.15.1783371935725;
        Mon, 06 Jul 2026 14:05:35 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:35 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:36 +0530
Subject: [PATCH v5 4/7] arm64: dts: qcom: shikra: Add Adreno SMMU node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-4-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=1898;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=EYNcq3OFs2Ql/wREKtEM5ji0GMxwTnKnJ9RpGAjMe6E=;
 b=DsMZ8weeC1FJ28PI4GwkWbJKDNIUqDgYuPQPbdoJatJcqoYjN0mvkvVRCXgkFLpEvRW9GGIIr
 imbpv+kai9SDEKXMg7NTAHIPZgWtHd9Y91kx+N0s6PgP2ncPgsQzm6p
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4c18a1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=zTWU315qYGxAnKAOPQ0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: OAW3EiNMzWI771JFR2pTEvlDyw9oianz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX118Qp+anl+eE
 kzysYqq+OXKfqgxX7MEnpBfNB13fdc1WsTmgtUz99Z3rxy6HQb0g9VMxj8pc/9pppacuvR53O+G
 6Rx+SO5egVXvhiLLI9w5HioabUzHW7YIHrGeNcf9o/lD95GIxbbO0NwELNLTimWSU1SGJcJgVfh
 h45RhinhFRaePc3A+246Havt//fzOK5fbpz6C1qTY1wLmyxmzxhJQEW/H7kIGaQ+ga/cVhlLScj
 /szKtOqr4fi4gCpsWL32NnQkxF5VP8jVWdUjC6N/GwCdBAB7ZYn6HgswZhKwG87y+lZHbNfveUx
 LAJL9SQKdoJX8WCL48rUlybwUoGoz+E9XB5EJswSACeze1NDqstNeq8jZgZEpUHRx5+BBxEEC5f
 xtonNAWssa+ckU7ld2Bflcrzqd2rBh8JfcAz/HW1DRdQXptDpC3TY+BbYNpEomP1qvjtGOa34Qy
 sOa6hs8xzo2G2JsmSMA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX/bY0aae0Arth
 +zUOKvIlN7j7m1+GrjQMR5fxq4RszMAGre8qRpcVgy7xNRk+Ks+OsjBEZKMggpJKFEFGdbp875Q
 mppqDB6MmReXv8+mafLkzKfgL7t22j4=
X-Proofpoint-GUID: OAW3EiNMzWI771JFR2pTEvlDyw9oianz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060213
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117034-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7182715A02

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index be443b362576..bb11e832d9a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2005,6 +2005,35 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@59a0000 {
+			compatible = "qcom,shikra-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x059a0000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>;
+			clock-names = "hlos",
+				      "bus",
+				      "iface",
+				      "ahb";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.54.0


