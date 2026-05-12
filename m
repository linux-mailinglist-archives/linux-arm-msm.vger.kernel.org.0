Return-Path: <linux-arm-msm+bounces-107120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DbwBgU7A2qh1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:36:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A62F7522AAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E7D530BA9E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 14:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF853B2D38;
	Tue, 12 May 2026 14:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tp3NkvFR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gjOh2A7e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415603B441C
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 14:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596303; cv=none; b=Xt3BbMJn1cl3w9AiyakEjseWUBSKikpReZj0SlOjqECIJ42GEqxb7oqCpZxvKqMD7Ecox85kNQA8G6+MrXAwy7EY/5ffh3YCFQg9Tpl1M2hE+gOnD/CAbn0D4gqxDtECLac/wy5dFGXANMvfM/9cE1k07k5QcAFwSKcdlZDz22o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596303; c=relaxed/simple;
	bh=7hhhRjovjPTte3B6wdcGjtm8ufMVjN7VfBtqElp6qJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UwE72knh9ENYAtk9ib0Z+0iUtjvO/q/JY5TjYUv6i/V1yUz4UG5XLV0XdfhNf30qp8VnTxm2/Af7hsevq/YQ6346iPTjOrwFAWs0WSluqUG2YtbeqJdoypmWqxQg0PFIC+abfL/MIEUJQ4my8v3C6vjDNWdGZRYc3Z/UW06pSDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tp3NkvFR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gjOh2A7e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB2qmq3443742
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 14:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R5ohXXZgSXvgAPCzQfBUllGq09yWK4vhsb5Zm7evNUk=; b=Tp3NkvFRXj91BNSH
	uG2m+rFwjZT4c7z+hYQwCwLOHFmCgTnZuusf08MjzCiAIWCMrJQPp0KDws65S5DP
	Pb0UL/o13ERsQXiOltwcY9CsPAAkCNEw07dnMTXIyZRTfiEn9m/76cIjdCtX/7el
	vvCzCpufkm79E2f2HTB1VYFjMtoeMBXsjVfPZLqu2zfp3ng46abQyEQzvOkgbkxk
	PFG5xg1T203HIAkv2uwegL8ddv2tNxHYCZ3zYbpFWsQvFNElsFRf8RMo46KZ32M4
	zcMVlQgi8u0QjgvCQFGmnBwEp2vkDQ2gIaL+F3nCrjmh1n8Rk18ul+0f4Lok08fe
	sOZ1jQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0kp7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 14:31:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso61382825ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 07:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778596301; x=1779201101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5ohXXZgSXvgAPCzQfBUllGq09yWK4vhsb5Zm7evNUk=;
        b=gjOh2A7eUCz+LEA1JYQJjXORYMLUz0/G/jldYBBNa3+S3FOTy3LWDZrDAq3dd9ustL
         sL1wf9bvb2SGmRjtcJnEbWG126uQdQpvSD78wgIe0fOIarfulwSvA4Dj4UM5twmJTo6s
         1CWG7Ct13PPVLD5I+UuHrJ7lk/7cnkJdBZYAgXtCZtmYkm965t4WfljjJKHEchOi9lnC
         sDLDd6zZHz7eBbMMUuEDql/XqXhaHvonQPJQVOUYhwiVnw6vwSM18UyJyWKlok88w//G
         Ptdl0nWuUfqpSKM6Ujh6brCWoKbyNfowai2Zeq7gJN89zeBkMZx75nOoAaHD5eTok+0g
         saMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596301; x=1779201101;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R5ohXXZgSXvgAPCzQfBUllGq09yWK4vhsb5Zm7evNUk=;
        b=pGgHlfCBRlVp6r4ulVDOfTXm0uuTJrOiK4cCSvhcxu5j5zdwENqItq+YUOxgxSwlng
         vAhFMN4Ghb1viMOhnHcjmaHMVVfr2oWCvd9ks5z1b/t+W/f1AWvVUrxMWMeOqM1SHU3s
         N2tg5ha4ZAXat0nUuY8DyTQ5Vfpp4DDRDvUJqNrsYfjcv2OOzqqlkA0eVbhySUPiqHWZ
         kD40zwJkjxJumPTyZ06g2J0RM6Av9W8AWGdrSpCilkFOeF4zSd+BH8W8Rhbqqe748mhD
         ehjs6TA0r1ND3zYkf0RgxZx3kmXE3idwk8z4NiZbRUi9/n8qamgWE41f5tDzSb3Gmswz
         ntOw==
X-Forwarded-Encrypted: i=1; AFNElJ+7f+LTASElxW6CbSfKpvesqsV5UPWhv3r9mTy3CCZ48LzCTzvs/UubFc2SqI/RR3I7doMdqayNwL46p3iA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8i4ve8AAMcQNW1ceG5Dljuntohgzm90WzIUXXBVyjHV+3wF9z
	rN2pmavoAzYTtObQ1zo0Edu4N3d2J7qySHA3Fi+AWvhEnBLkBwBkuf/z22B2tjbEjJ6/UlJcbN/
	Bu3FaCviNfLAFECEmK+21Mcv2J6x9aQubAmNtk1c8ah+YAddLXUqW7jFJJPu/uclZK1WLtru79J
	19
X-Gm-Gg: Acq92OFiWSr671m0sxdNKTn7qMqpBsa75LaTf87qj41MmJYDz7BrwQQGfmwGo6eDm0a
	6OWpiwJTaqRaCvm9oIql3R7Xv9tkOgXpllBydVuHCOwXM6Ad/abyB9yDIUa3mS1MBW3zDsz8AFf
	hWB0yc+bZd/16Tz+vC5voVvzfotMtNo0z5SnhLYN3qOkdHWFXeXFfEDMSE9wzhIG5+sA8oLdtEF
	B21dbqRS/qNt0mtlowzPfjhv2nqhsjB29xaYgYvEQIegKfnkZRO54xpGP4HeAYk8uvO3Thdq1PG
	5+COi2AVoOwmOaHDesrjbRibPqpFIO/uWLpuCIoh5xJMhSqrLzSd7ozNUV2N7TvHt4lBn0tNU/F
	Vyk5mlaxyaKh+BXrQ0bOj+f7G0J1XmFMc9OCTcxfKOC8cd0o7Y/o=
X-Received: by 2002:a17:902:d58d:b0:2b0:5795:9ead with SMTP id d9443c01a7336-2ba78815137mr279781555ad.0.1778596300484;
        Tue, 12 May 2026 07:31:40 -0700 (PDT)
X-Received: by 2002:a17:902:d58d:b0:2b0:5795:9ead with SMTP id d9443c01a7336-2ba78815137mr279781085ad.0.1778596299919;
        Tue, 12 May 2026 07:31:39 -0700 (PDT)
Received: from [192.168.1.102] ([120.56.206.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f27sm172053135ad.36.2026.05.12.07.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:31:39 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Alex Elder <elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Veerabhadrarao Badiganti <veerabhadrarao.badiganti@oss.qualcomm.com>,
        Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
        Akhil Vinod <akhil.vinod@oss.qualcomm.com>
In-Reply-To: <20260414-reset_worker_deadlock-v2-0-42fd682b45db@oss.qualcomm.com>
References: <20260414-reset_worker_deadlock-v2-0-42fd682b45db@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] bus: mhi: ep: Fix state_lock protection issues
Message-Id: <177859629568.33665.17821318659003134419.b4-ty@b4>
Date: Tue, 12 May 2026 20:01:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Authority-Analysis: v=2.4 cv=V+xNF+ni c=1 sm=1 tr=0 ts=6a0339cd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=QuRtzvr4xB5J0le8HPcEzQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=toWtcFszFmKex18n8fsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 27tTL74LnmhhgjxuVaRUtdyIPvPRcZs3
X-Proofpoint-ORIG-GUID: 27tTL74LnmhhgjxuVaRUtdyIPvPRcZs3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE1MiBTYWx0ZWRfX8MVv3gohbtw6
 +MrRpBvItQwBqjUMtyd4ZAxZIyZ8+MgyF4/LZmgOdJK/Aweop/wwo4vrsUX/NjK4b3tBTAwVE/x
 VdeIendBqVvijHXWkLFDcBNnBKEABtQCcl38IikGU0Nr/dGdAtzlNFc3B0DozenhKYpy80AXVMU
 YBq+o0uiLZZQ6MdgZbzK24jNiuMPrqBD6OpIVqqRnzNwT/Jd72VkLx9jQqFtUIRXF559cJv+xLa
 jGxxxWHGh8y1u2Wtdcs1XtTwPtsPf+Yzs0ZPzMqymiZaz4igw4gan+XbxV1j/DIcNWn/VINUf2s
 VYYq3ftOXuYCTtxCDf2GrQVfmPyV72JYtHdJ3nnhDx9LxWB5i5XMQahCAuZuHtKFM5J38xY21VL
 EZ3d4XD91lIpMEbhhO4/fuXiGRO+34rDPsXA8M8f6sKR71QLK1s48CsM5nr3BK/omXvgCL9Hlvh
 nqqt+TA+4aOFOuX/opA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120152
X-Rspamd-Queue-Id: A62F7522AAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107120-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Tue, 14 Apr 2026 11:59:39 +0530, Sumit Kumar wrote:
> This series fixes a deadlock in mhi_ep_reset_worker() where state_lock is
> acquired twice, and adds missing lock protection for mhi_state access in
> mhi_ep_power_up() to prevent race conditions and state machine corruption.

Applied, thanks!

[1/2] bus: mhi: ep: Fix potential deadlock in mhi_ep_reset_worker()
      commit: 9dece4435d396e9877e27483552b910ba8654169
[2/2] bus: mhi: ep: Add missing state_lock protection for mhi_state access
      commit: ce3e534ee9c8d13a68c8a611c3b7bd0c2152d2ab

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


