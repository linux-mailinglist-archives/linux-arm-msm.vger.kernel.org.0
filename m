Return-Path: <linux-arm-msm+bounces-110844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XjXGNhpIH2pRjgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 23:16:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 343746320CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 23:16:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gD2vEr+D;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OD5PbOz0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110844-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110844-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72FFF3002293
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 21:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1064436EA80;
	Tue,  2 Jun 2026 21:12:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D635219E839
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 21:12:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434761; cv=none; b=kxMoa4dsOZQSot0CYjMkCi5Jjrv7Z4+k75HvtgB6Bt1URXjLm7zM5/fXQVKB9p1BnhLMgqy+kDqGPI03+oxQF7ABii6ZM8/4d8m06XnfQWOuGcty4a22gh/vu3ytaBeSqrgA8tRY2d0EQqCPK7Ksro6k+5ESz+35QYMOkjS2740=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434761; c=relaxed/simple;
	bh=rDeXtDL/PJbNE80wWmAYiMIlUv/C2tp5BR6QLjbzJRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PcbElYsGJb9Kbdkg5TaqrTFWomXzMFDlQ3yQyeIZazRRpqhNN4sFL7Lnp5RX8T4PYgIV9Ts8rSo2Koco5t1NcPwO4R06U3/9Ww03rBstC5MxQqBMHcEHKXg9ls4tTzNbJJgBMAN1Gxmlsaps38bFBYvl0mUqnA+kOv1s8BlLy0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gD2vEr+D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OD5PbOz0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652Kcoon2884623
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 21:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mhSG96DeO4siCnlPLzkltobE8Bmk/gbxupxseeS1UBg=; b=gD2vEr+DoVPkixd4
	cS5j0E9R7LlPbyh5DJAyVIC+Vr9/uVwFOxWYlZxSnp2J0O3XKqaSpef9w4Y8LowJ
	RxbebOXoXSe5/TuC4wFmLDzTqCIqpyhLiMwLofoHxnuFQqoWQFUry04+vVV7dCps
	hkTJ40ct7QjixlXT66rUe1A78PQU4/qcUc5YC8gCnPFrRxDhwmDWKjkDkSWvdKvt
	WrCztXkU92kt2PGjAb/Q2GaQIgnhYUqNicBQiNq1rIOx42qhMYRibSyEl+iRI6+R
	kUkY4nB7BAJqgE+kaSKA/Ew3TG4YP3pWFt5FvHugJVaK3vms/UpEibeb9E7H07wA
	28VgXQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsu13m2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 21:12:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51772325a64so11713021cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 14:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780434758; x=1781039558; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhSG96DeO4siCnlPLzkltobE8Bmk/gbxupxseeS1UBg=;
        b=OD5PbOz04O+DdhFIY7qgukXc/tWkf576hLkuvjzwuZiTI0oyc8lCu27KI+NYIwbfyh
         guaMpA/C5mgzqdUMrqPYkhf1R9yKvn9lmv6SpQFL4DvENXl0z/ZWw8wWJEI+ckvKBjPa
         cUM+lNHXct3kvL4C+MGNgpm/pDKePowyLJnjrqqjZvARVH3CAixxu7/+zFhT6pHq8spI
         ho6TcXxvGNNP7EQRBGbURUvUWWC/6lFxleIezjniurcojJ91r1jY/DHfutA+F83rs4PZ
         K1htGsm+8jD2l9Ll21RXyJxMyP43Fh1tjsjK4qKzSTISVI325ue5aLU0ciI42l2yIbGn
         6+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780434758; x=1781039558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhSG96DeO4siCnlPLzkltobE8Bmk/gbxupxseeS1UBg=;
        b=exbxsloz8c0c++n6r4g+eC1YXNOrR6+djbkrj55C0W4FGe7Qcftz3xV3Gm9rLCANX6
         mhkzs3kpZvjyMwLClV2k0G6pOryJMjhEP+VVrnHExMLB41FiCgvofsJZjauy5nIhqT3A
         ROxNIixjy6ftCBPASBDkjHDjP2aRh70Am6pKyHrjN/C14Lcup/O/6CVittK8hIVPUWAT
         23/Fk9XITK/Zlqp8xHo/kpsTLq1MX5MsXrgBPztaM9f5UwuwiUUstCnU14CUgrUXa+47
         a1a8M7ZMFTluNBaiwyA2ayycABDRjGHQF9NRaUx079+b9eiM7zJg7J2nPc+VUK9dpNw/
         I81A==
X-Gm-Message-State: AOJu0Yz++mu+hb8Ccyvs/Jiekbby7CruliLbjyJ3QGVtN13w2/qlybKS
	Lj1wGUsc00DputKm3V5ACV7oB8Ilg4z7yzcElzFS5uo+8ka3+vQKhM/EErKoXK1kE9GciCDDG1G
	UVtX2sx6KsoiP01zMcSk6SvLGmbRI9/BJvcCaFgvy4i4QGG9c9CFucaRSaiJmuoupmzMe
X-Gm-Gg: Acq92OE8hSnMks5ts0dhlq3RVDL8L1XsdOvhzNqv91HxlYQn+e/f0guQ4CSsn9rAPf4
	Y7u1rfcRwPp2T8DGwuCGD0V4SyR34oAdySf2+3U9ZYCDrM2UKDfVv9+wS/rtpgDRYusywaSPFWG
	1AYhY9xNhhrN4CWb/pi1+ayzMon1xrcopBoIBxpR3/lamF2FNGqG6RkVXjUTrVMMMtRYRkaJux4
	dartiZItCSzzGEX4DHXsNOXpAyFb6vQ6dLFB+pf+ZAjqtFeyQUS9uerOm9xfZas6v3tBYr/WUCT
	NLKOkXJ0ltGKQv2lNWz62kIfRA1JNYGxfAhuG2rDgarRx2KDaWKgGLtFq2zDSkyue9yotS2VGem
	VccVLqdby765/fINr6/eOGRjVr8LCcpolY0A2Utgo6GUqs3gqTVvJhMANntiE+Im1jLCAB4CVlD
	RC
X-Received: by 2002:a05:622a:190a:b0:516:d955:ea4 with SMTP id d75a77b69052e-517785d8ec1mr14317761cf.17.1780434757987;
        Tue, 02 Jun 2026 14:12:37 -0700 (PDT)
X-Received: by 2002:a05:622a:190a:b0:516:d955:ea4 with SMTP id d75a77b69052e-517785d8ec1mr14317431cf.17.1780434757610;
        Tue, 02 Jun 2026 14:12:37 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm2086132f8f.37.2026.06.02.14.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 14:12:36 -0700 (PDT)
Message-ID: <993ef9ed-65d8-4bcd-b0f9-fa6f167395d2@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 23:12:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] thermal: qcom: tsens: refine wake IRQ handling for
 suspend
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260601-tsens_interrupt_wake_control-v2-0-ce9570946abd@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260601-tsens_interrupt_wake_control-v2-0-ce9570946abd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fbsklEpQcW6M3ukXuJCPhEnM6JJfDVXa
X-Proofpoint-GUID: fbsklEpQcW6M3ukXuJCPhEnM6JJfDVXa
X-Authority-Analysis: v=2.4 cv=MKFQXsZl c=1 sm=1 tr=0 ts=6a1f4746 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BZznKAv9R9A1RLtjlQAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIwNiBTYWx0ZWRfX8koMwN2ce2SD
 wXsQla2BSe7gSQjnTw0aSK42gP2hICxxzX/xKE6o93HfWTWeuhWsuIr8xeO41+j84feTJb0YzmQ
 drhlPqDXDSJTLWYqCbHc3RbBDYqmFBRCmUh5hjG24rYDWuYANFw432DzsYfRBozYYXdIZWWAp6v
 eLwcMk6m15Y4Fu8EoGUARVRzPaz6AcJX45FMHd1SJS0nj3Fv03eOsn3B8HkHtrQZEQgN/9wrUjg
 1vddlzOAYM7LOl2MU3R+ghQ/FrqJMRrOBlVIKbCNNrGs65yeQDA23/ULghu+PtKjOfKOJlKgI5N
 Eqa2kxQ4Eg4RNWj6MUPU5ZvDUhctPUR0MfSflnTnIi3rfJkmLAyNc5ZWIPwu5xX/W/9IORXXe2t
 hhyRWD2BkAZkqloW1AISczE+XFdrvG7cHvP98omtTTkujbou/I1qVPiRC5gJlk7MEwJALm95ZHn
 ez1XzF7IteSUZxwLA5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110844-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:priyansh.jain@oss.qualcomm.com,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 343746320CC

On 6/1/26 08:37, Priyansh Jain wrote:
> This series refines how TSENS threshold IRQs are used as wake sources
> across suspend/resume.
> 
> Patch 1 moves IRQ wake control from registration time into PM callbacks,
> so wakeup configuration follows the actual suspend state instead of being
> left enabled during normal runtime.
> 
> Patch 2 adds a platform-data opt-out for wake IRQ setup and uses it for
> automotive TSENS compatibles (SA8775P/SA8255P), where parking suspend
> should not be exited repeatedly due to TSENS threshold wake events.
> 
> Series highlights:
> - store and manage TSENS IRQ wake state in suspend/resume paths
> - keep existing runtime monitoring behavior unchanged
> - disable TSENS wake IRQ setup for selected automotive targets
> 
> Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
> ---

Applied, thanks


