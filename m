Return-Path: <linux-arm-msm+bounces-85639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB773CCA978
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:10:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B84A93063161
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 07:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460E92248A4;
	Thu, 18 Dec 2025 07:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tcj5i1sO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OkH/lBLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3F523D2AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 07:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766041673; cv=none; b=jbdLEuq2t2pUeWVkeW03vhVpF12BJQ2Rgy/uQTN7EAHpeg19jSdKS9G2qESplZI959XjdT2/Q3v5hooTdonv87L4pRB2yfTGXCwO58eUEaCQEa9WgtnmZpr50Vl5KnaZ/hFgVEkkka7OxudBa2F6LAsG6FcWJsWrFhldNHIfvac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766041673; c=relaxed/simple;
	bh=UvVZ96eGgGZ7aZdP/ro0L4KqWpxNm1vDLLkOz27O/2k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AHbB2E/vEkZrNHDPZK++IpB5h/1sKHAiKT0dY6k4whTyPKR4NigWyCVitlHX6lJoamtbqHnk5r+TBeWcQmw+VLA9A8GJT+nXjFSWFjrpaLbku2wUj5a3CBlahglxNqi4PimDdS35dQLgbb146rYu8Pw/e2Ax0CmQYQF87TJ6w5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tcj5i1sO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OkH/lBLd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YNl1237284
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 07:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WO/7Iu4Vj+UiCe9ZLdLVp8Dioi+keWzDQdYuQnODphI=; b=Tcj5i1sO/731NiNL
	0K4F00Gn35wOCD1FfckYNPGRTsr20yQKHqxTQtXS+yyoBcA+r9alkNVawz2jIBa2
	poLY+aq4pASSZaOxMZRFxnH6yqo9u+mzoIZC+QmrqcAHcbECEn3VH7wH/F8Qr4gT
	aCHfSVpFGadsBQepw/+9nRKXvvca219O+13/I2IIZNLbaIjTRj35nEDBka0KxfCL
	pR6oF2IeNY/n44mLK5egDyXNtQGEEGp8lUw/YY04iuy8OzEhfKQAZX7EdUyXv/iU
	cFo7d6V2CLq4nXNRDpQd3cj7zUbkreSytgXkQiywZBvutM5bELSV26vrK8HRuG2S
	u9pPaw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3ha9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 07:07:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7ba92341f38so494026b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 23:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766041669; x=1766646469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WO/7Iu4Vj+UiCe9ZLdLVp8Dioi+keWzDQdYuQnODphI=;
        b=OkH/lBLdDDSYu9WffdRA47ts2axaTB5WVoF4iXrG1xqqv5Ith1Dqxi8LuoV7nyGDAm
         2dVCEcMDjsFtgaYq5hsi2X6mSTe2RULSKO1TQ18BtnQER8LZWbb1exH/SKWw9K+zZztk
         wFqAFRivIuexLY/GyVO+nkl06/3jEF/PO6HTgFEzQ9YouqOWVPou6m2Ia7I1qrgfYvju
         fO1fTDpx5MkYRP7B0PU9RxghnQgvgfydTq1SZiM5ttMSOK3B4mBt59ryui4DwNNoaDIt
         oRmvHykaOSzXgotwlaVnzDbmFVliwTWucu3wnupeaF8kIVG5TLO/J79w7k1LdQvI5edJ
         /pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766041669; x=1766646469;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WO/7Iu4Vj+UiCe9ZLdLVp8Dioi+keWzDQdYuQnODphI=;
        b=D4kCcBELVtjqW3cT+KdEswxqwOCFtVCntSVG8G1dvE0rO+uodVoWi5Nb9khdiNrw8G
         VqbSaMWxGSugGTSgpavRLpLJG5Ea9jZITDlnLmcehr/i7mIlYqhMMfVRSMRp7NsT9HB4
         38uOht++QoEaSR5eRTx6ChWZx/iOMGl4bY8VVHhuYcGpj//tXXzbZm2schi2xn2BxzsJ
         ckwnJj323v2uIdhHaP+i/1jt7B1TrF1SPxqi7hi3VTJnlkcJqNxA7tk/+TdHVFd4c+19
         Rvp1PVxcvOS3HBHbm6D8RJdFFrWay4lQ71T6XS05WvGEg74MI9zGxfFjhv2VX1rEb1GV
         SZFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq00Wcv0pfsQDhnyQUmbDEBGw786o8J2itWeZnEgyijs809LSMqwbbcn9fl+mJ/GxAi3COF5IlZcXz7Nx4@vger.kernel.org
X-Gm-Message-State: AOJu0YzFV3FJ75agwKEFeMNWs0DcSjcRsqcCg9fq1/yuT9yC5eY0Nx6C
	Pwc+7AoYEtzL4R8b0wkZkQniwntF90z62t458oCkrTvYPuqzKhntxtknCwgpAwNZl89+mAxxpsC
	AmA0nsGl/22vHeDgyTH2/dcLgpQsf4f7TKHMNcjXlONi21s8Oyr1x2i3Cz6fS961lchAa
X-Gm-Gg: AY/fxX5g8gknxldxJNW5zAVm4bYasV072X1VSgbVajyQbJFF5QYA0wskgHTguu5mrIH
	VU3AIcnAzld9906ZIJwmOV+459OsOlRC8ZISmiUdFuhthstNqH7Jk5o055NkWXwTaQ58d0g+jct
	Hu8yME0WBJw3EqCMY6gBZetgaWiX9Wl29XV5g6cRJC6Fcw+ERtey8vQU0mMlO4T3p1aGuPN6nfw
	2nlxteneCXpl7eV7FWdLA8Eu7upx0n8gHEzkJV9EIggny+r8tJfjnLCwvajqjeckHu+T4CDR7oZ
	4DI+kU7/yI7Zu5Gtkd74fyUK+MqE1o58F/3wPyDSG7MSWlAgF+3sCEYMRkAodyjUF/TULHkp6W6
	+jhW2yl/yCUo=
X-Received: by 2002:a05:6a00:f03:b0:7e8:43f5:bd3a with SMTP id d2e1a72fcca58-7f6691b48f4mr18451596b3a.38.1766041668460;
        Wed, 17 Dec 2025 23:07:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIxc3Ba7kYqRT6O1G8e+PsY7D8Sy48R60zLnBO0db5g/v7kywvaHG0MylHhjnj2PISc5FkVA==
X-Received: by 2002:a05:6a00:f03:b0:7e8:43f5:bd3a with SMTP id d2e1a72fcca58-7f6691b48f4mr18451572b3a.38.1766041668005;
        Wed, 17 Dec 2025 23:07:48 -0800 (PST)
Received: from [192.168.1.102] ([117.193.213.102])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe1185704fsm1558626b3a.13.2025.12.17.23.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 23:07:47 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Michal Hocko <mhocko@suse.com>,
        Krzysztof Wilczynski <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
In-Reply-To: <20251107142835.237636-1-marco.crivellari@suse.com>
References: <20251107142835.237636-1-marco.crivellari@suse.com>
Subject: Re: [PATCH] PCI: endpoint: epf-mhi: add WQ_PERCPU to
 alloc_workqueue users
Message-Id: <176604166443.697128.8351761767000938363.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 12:37:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA1NiBTYWx0ZWRfX1RHNyxNjvgvn
 XVwcwZp/i1Oh+cjD2D1hbteTeTjuoA4Ir25W6of0ilS28tvxiBFIg3vyJeBJTMv8vt4Xh2zePr1
 xMtIi2Yn+/6xBkg30s0G2ixPkgp3KQlly7YUDaXicy3amc33QVEEhACe2RHRlyMpYdsZM9i6fxS
 XhYYnUazQh8nZG33QBRF9KpEDILO9M+emBEqLC5npUVTX8oh9X1/wMW0t/r7DSnFgBqS3At52li
 CPgcJpOrgO5G5JqH/8Q2/YROtBqwmkIXrSeMXHR/lELo/3+S5kMJnmoZNhNMMGXDeN5/tndKizN
 aKMnf64X+SwMSgrqHkSJ/bSR3blIVgQnZ49uBNIWBEG2uZa4Huwceb9K+rsNjVZeIND4oYljU5J
 a98US0BgCn1DbZJc4/0s9bbazFyeDQ==
X-Proofpoint-GUID: 49oHYNrWdU4ChtYX0Y09k0rIhqcYX8Jp
X-Proofpoint-ORIG-GUID: 49oHYNrWdU4ChtYX0Y09k0rIhqcYX8Jp
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=6943a845 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=PLOdWElDzbaVVj/XHNhp9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=_suGTTe_43wmAZudwJ8A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180056


On Fri, 07 Nov 2025 15:28:35 +0100, Marco Crivellari wrote:
> Currently if a user enqueues a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
> 
> [...]

Applied, thanks!

[1/1] PCI: endpoint: epf-mhi: add WQ_PERCPU to alloc_workqueue users
      commit: 5c826b1540045cf5824eeca7c967cc25692afc23

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


