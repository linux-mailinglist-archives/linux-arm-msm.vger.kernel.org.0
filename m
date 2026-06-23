Return-Path: <linux-arm-msm+bounces-114195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HhHLEBF0OmqQ9QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:54:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CF76B6E67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:54:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Vvc/uqFU";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=S0ojvVmf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114195-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114195-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B2265303F1C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 11:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45493D5246;
	Tue, 23 Jun 2026 11:54:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8DF3D47CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:54:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215692; cv=pass; b=cJkyXamgcUmEdUScWmzyPmczEG0BMmIMcNu88ecgfsDgWNmOu699gfL7UX8AzCId5nCbKQ024u601MLeJLREIy+GrKJPAgk1xDxSRcGypJ4RmvRzlS4RsEGlTuiq9EjYH7KAMBwpei7sjlAzX+JfE+I1VVN396GukiKFaqI2Tc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215692; c=relaxed/simple;
	bh=RRpkkLa0W2etFg/RhsIv5UIlJlesmVn4cGN+MF0OYls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCDZK1D9LkBV0IdiemUg7R6EbhFz5QugndEPjbvbJoBRFGtsiesMMlY3+tBKH4eE9O5Bd+qxLYHhCJF4+7DbjTq47q5zMBh5797zBBCeR9ZAofPS2UOmHyvjukwgy839WllaFKrr3Ui/wD1kkSql5JbtrZ/r/VDvkyXgroJqdvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vvc/uqFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S0ojvVmf; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZNDP4017423
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=; b=Vvc/uqFUHWTIaaHw
	CgykLxh+JHbckuAbxr8LVfoxnnIpUyBQj287laGknSqX7pOZSSLpGsPrSAYWRcS+
	k+H+i40QkYoQxdBykEvh5BrF6HyKN3Td1orFAy1o2bYjnSuwYjOwvcRofmktQE5k
	hMqVRmd0wJAgUGR1+zMxIcflbZlA5seD39z7St0Kbrike7NxXRQOmlwaK0X5nhTm
	yPe5OSX6oy6SXOyRLgdjXnZbsO/scPyawcLxVz2PGhOunTtpvEwhL1Bb0WBJqd73
	yNUIKOr3FoCTo2VwA5NNDjw4wW28XoaBUS9X7FrTqyhPI+MtMGKYDfZEQkulIne0
	+DOtnA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjj56x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 11:54:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91598ab3a1aso688300885a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 04:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782215689; cv=none;
        d=google.com; s=arc-20240605;
        b=ZpclYwYDFlyQcKRs1IBDAfs5rPAf7/Hcu7KYmYrVhcyh6fgt8BRCXxI2gkCgbrz+VR
         JJKjjSMvnCSjfF9/6Iitz0yC/Cv5hPhJI0icoO4x0PclaGjXPq7mWxlVv+GIlVmuWqhM
         ExJ8E7NhNsdO2JEVNCam2fnPHQljeWeOh/uDQYOiIwtfjuzr5nnsrvV3Rp0CLplPi4gC
         fTe5ePnqggehq/yH1Ya7TupPoE+ZSVrbf6bZBsZYU1akdmRppwd5xmgcauvLG/ZgCjZ/
         0n0NdmwtdkQNBP095kWputk67Xt1lPDtZ8r/YxSvXwExOv6wIf1PuskEjwyXzNKrgTlV
         pltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=;
        fh=NkA8H/IM/g5dkuv7QKE+NyzormY/F6NymtLHu3zGpns=;
        b=jHEz9odaLFX+G3wFKLTHNQb7Il10o+8OGFsUAdVl2ASqxwYLbQUbsaJT5vKpnx1f5A
         C5crkNrYMUGI+Fg8lmjqMRp78V6K5myif9MxbNP6D6o8QT1VwR429OsJXwfOfYKbTsr1
         koZ2zA/34E/o/gaPnbYH9Xz8LBvfemEibPOBfuePIdADU0j1vTt2tABXqRsSo/gw0sFW
         KDCy2Ll2kQckXqSgYS+8xj4lVydxIqPKdeMJskxM7MmopEIjoksJuiKvImV/Fp7QIMgn
         +DOwOuNN1SDBr/+kPjfmmamtvdC9//9dl15Fwg21eLK0p8TQ73hhheh2zZ5asyc/gtp8
         pvBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782215689; x=1782820489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=;
        b=S0ojvVmfhtXj72V+zvd802umw2q1YHabvB+M1pAn7p0FkCXFhRfjdhc2M1i1vIoW6y
         4cCLGXQTosTK9XyDGKKkBLv2tb+xRXuOclf3Z67Shao9urJXFGZz6SjrvTVhfwxP1rwm
         W5jJDhHJhLWf0GwBHCQ5zRymUpMBULFtmT6zWBeaVYE2RbKozo3UFb38GS6aiYxZDVO/
         2VAFUzlh5txPMb83N+ddNWYn6eAL2EUhX6Ocpnzv4Qq3YI5xF46yXmNtgkF8FHSKXflI
         YpwBNUTu77VRoo3JbLRD1gZ9Ph6r6kDilhxLHsTUdZ3tolejXDWIbuqhe75nONkithgv
         OKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215689; x=1782820489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fw2vf7ZQ5Hwg4RRBsz2SP0jNtQYgUgnxAvq6NzRaRj8=;
        b=dgnlXXjb3vwcIrTIkl9dltLZ/qG8NnRsstDJkTP82k5a0UaGPSUdBJyk0feC8zYMao
         pG8NiCV9Kgj/irqtBa2ElCENfNaoKlBzukiLOoiwTQLHAnW6rIWcUqqrK536JM0mLwrg
         YWUP3+5yIyNn9UchyWImvtyIJZAElNlaj24zfNXfpQYiRXhZurrnV2IP/ueNiqKn8UOH
         8Cl4oALCAUwyAgy54tRN+8GPmWOPPwJ8ILR0ilCsI/n4//9bBQKeHKjDcedCd0zfh6W7
         QI3u4LwgppdptnO5grZP8syBidaywoLDbcdqo8KBv5uG3c3znpfqtI8RrUOPD2auwoPN
         B0oA==
X-Forwarded-Encrypted: i=1; AFNElJ+8UxwlFTSVKbrDJ55JSWlkEOs++Kjd2ZNUxgSBiHAkxdhvtgHT7MLnQ0ijrDESNJ9oG/KZ7eyCaMHpQnhu@vger.kernel.org
X-Gm-Message-State: AOJu0YzdMQTPjKxt0PdrM0d0sGdfQ2Dsc05Kf4y/L/k4cWU3CBt/zZEg
	wKTdlIZDbTcpAmRhg+yyS2+N4Cum4liyYk15lh3/9QFzTR5/F32P4nGHOdV2/q/zkMw1z2hLJlX
	imJK7iTv2+fQq+/4vmJG0A4CZGMEN+wLKMPuL9epWYOTiyuKOI0nYpC6LU63ss3S2D7oo6337T9
	F1YkleWnIaVWv/Bwo//Fy4hslq/twz7NRtANuZciK2rls=
X-Gm-Gg: AfdE7ckqWCWTeOBDHFbhU0esJVfpksiarBBxhqpq2drToam1vjLxey5OW42v+EFNBtI
	KFnKtUewHDKDKkp8sEi9CXBrskgFPZIGFMTzurhS/MGzr1LCVCEihXoAYfVGQc//BFfAoGAbI6N
	MMzxNHJXmZ/GsjwDvk16KQ//axfKYLXKQwn5omjeh1rpJb41DN1/X968VfML2HH0Bx9M9GsamBC
	wFS5IjbcPY78KfL/IGid6nOecHmuRq1uA4De+36lmPuY7N7Ibdz5i1Ni1O/G6//shr7IoYksMag
	3p2K19evCsM=
X-Received: by 2002:a05:620a:6cce:b0:916:4a9:f35a with SMTP id af79cd13be357-9264771b2a0mr434708185a.30.1782215689096;
        Tue, 23 Jun 2026 04:54:49 -0700 (PDT)
X-Received: by 2002:a05:620a:6cce:b0:916:4a9:f35a with SMTP id
 af79cd13be357-9264771b2a0mr434702185a.30.1782215688526; Tue, 23 Jun 2026
 04:54:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com> <20260622-fw_scoped-v1-4-a37d0aac0a68@nxp.com>
In-Reply-To: <20260622-fw_scoped-v1-4-a37d0aac0a68@nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:54:37 +0200
X-Gm-Features: AVVi8Cdel5T7fniqHB4_fyyFIVPTxPRe8hWJeBKySDY3t80yH0us_4QRaPBT6xo
Message-ID: <CAFEp6-1vaeC9oDKuPAdPNtmGSsewbHRFS9RcPMzzzWHjnXQA-w@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped()
 to simpifly code
To: Frank.Li@oss.nxp.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Heiko Stuebner <heiko@sntech.de>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
        Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfX31Xs7jcumbZp
 dYLizC2Xn5OjvezRUR3oAyDsZ0lXnK5cGe/J84jDA9V20D7cVh0aQHr093bQENoJdASu1hi873j
 QV8gCjviDwBwZri9RrCp9/0iPbYCqoVAgHI3WIr1y67F1neztGrjjwe0c+csKEDOQMtSmXmwdKs
 LbhxXr90ZiyuNeX2MgQECThP9g/OHfWPuuXNav/uTTeYKsqjfSjhcr4dBLBa/ZkcKEUnsYv8pkk
 7yfefxujoAFWsUSuOrhxuug9gMY1QvnpXnQxaW0WmP3g/lxD0rl46XIPV9n+ZgP7Ki5OY1YLUr9
 YJsSLr3kZNjLn0Qzr5ob+J/hKfRcexlLbUctbTOhJhcDJ7u/srOom/MJllnYraCjr3/5PD1SCtw
 8DXRTgnLcLc8mL4Ikn7x9bB5bHqBuB+ghBI04f57H6SYnVSB5LXY5ViL5LjU49scpnQAZmr0eNR
 eaui+uDcaDr6pRZfZpQ==
X-Proofpoint-GUID: Xu4ocPJsTKY4uJD6zSnQh295BGiBy_NZ
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a7409 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=9UnFPMSZPvWmRCPcKGwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5NyBTYWx0ZWRfXwzKep9cxsO2f
 E6LwT0u4/Pl5J5QJrW4tQjs7UicHTYdfZ09zjkL0Fv0639Yoi+IdsnDOcZ/mXIQCK2w1sITLvNk
 HJUIz+XaSnClLKG6ceRmeQU/92q3HQM=
X-Proofpoint-ORIG-GUID: Xu4ocPJsTKY4uJD6zSnQh295BGiBy_NZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114195-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:andriy.shevchenko@linux.intel.com,m:djrscally@gmail.com,m:heikki.krogerus@linux.intel.com,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mchehab@kernel.org,m:dafna@fastmail.com,m:laurent.pinchart@ideasonboard.com,m:heiko@sntech.de,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:driver-core@lists.linux.dev,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:Frank.Li@nxp.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,fastmail.com,ideasonboard.com,sntech.de,linaro.org,lists.linux.dev,vger.kernel.org,lists.infradead.org,nxp.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D9CF76B6E67

On Mon, Jun 22, 2026 at 4:31=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Use fwnode_graph_for_each_endpoint_scoped() to simpifly code.
>
> No functional changes.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..23f3cc30a15a5 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4793,30 +4793,23 @@ static int camss_parse_endpoint_node(struct devic=
e *dev,
>  static int camss_parse_ports(struct camss *camss)
>  {
>         struct device *dev =3D camss->dev;
> -       struct fwnode_handle *fwnode =3D dev_fwnode(dev), *ep;
> +       struct fwnode_handle *fwnode =3D dev_fwnode(dev);
>         int ret;
>
> -       fwnode_graph_for_each_endpoint(fwnode, ep) {
> +       fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
>                 struct camss_async_subdev *csd;
>
>                 csd =3D v4l2_async_nf_add_fwnode_remote(&camss->notifier,=
 ep,
>                                                       typeof(*csd));
> -               if (IS_ERR(csd)) {
> -                       ret =3D PTR_ERR(csd);
> -                       goto err_cleanup;
> -               }
> +               if (IS_ERR(csd))
> +                       return PTR_ERR(csd);
>
>                 ret =3D camss_parse_endpoint_node(dev, ep, csd);
>                 if (ret < 0)
> -                       goto err_cleanup;
> +                       return ret;
>         }
>
>         return 0;
> -
> -err_cleanup:
> -       fwnode_handle_put(ep);
> -
> -       return ret;
>  }
>
>  /*
>
> --
> 2.43.0
>

