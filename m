Return-Path: <linux-arm-msm+bounces-98675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EV8Nji9u2n1ngIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:09:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A19D2C8611
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 10:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94C3D310AC33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 09:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DFCA36C0B0;
	Thu, 19 Mar 2026 09:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDaIyYIl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZhy89kG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C6F366DDA
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773911019; cv=none; b=HiJYiBJ5nI9vVT4Z1EVuBE1Feo+xGVmRNjEGsWSz2vwbXRghcvw2yKn7mEpS5Iye5f/u8KjkpyMuCQJoUchVUZm00shoK2EbgAeHz6QnigsTyy66+xMmwmQAei9KN0J7gOxyyiJbyWROYunztiBLqdIvKOfgRrzReR4+DCj3X9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773911019; c=relaxed/simple;
	bh=Qbo2AkY1+KjetyfH9FvzCECSvTy3I3x1KOVPsNZJnkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlLU8I4YetuRE5MD0/3C8QcUx2Z+DUKIimYMbJPNaZ29jI8hTLNbTbLGz+E+VUY72Vxh4vzXZV18rXpLdTBjic6J9/TfNNZu/TUlZR3uUwJPRzyP+/wxE1g6vZ6zbcr5ZsGT6MCGDZQzOaMAxbLCMXv53MDhh9w961XV0ctj6bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDaIyYIl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZhy89kG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J740qx2666132
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOadfTGg9xXeghJQxazIB0gRjzi9FFaPD4IXx5xRYT8=; b=pDaIyYIlvN0wuiGE
	TSxmvlJbNDKe5yQA6eRib0d8v9JHLuOnmop1c0g7YxdC0MZVN3WwykbOAmzvoyBN
	Tdr7au9HdDA5so5A8/bbhcD7g27vAyVMfv2bfiYVCb/90mDqzs3Pt/rtokD/JajY
	4rD0L2QBuwI5zmrfROZsV6JbmOeGJt6FJc1KQQoVuZtUNN2LGau1qVtnceuF5FHk
	Lh9vWgWXevYpdJgU9sIsBN7eVR81vH4MABkwpqjSbKhhPxNZW4sLIigzjK44kWyn
	aHiZQTYKEvoIpk4ZYgO6hrhg12SvOEOHpseM68lqL1+HlVUXVdE2cO35PKhmpsf4
	8O+rpg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj542br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 09:03:37 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a0686edbcso498036b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 02:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773911016; x=1774515816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jOadfTGg9xXeghJQxazIB0gRjzi9FFaPD4IXx5xRYT8=;
        b=YZhy89kGoqp3fbUis1Ihi/I9VbSNSXInKcX+BWu0Rty26CEIz1FQRNmGFEfDo7AJpk
         JrquiwqEsHresTslLmDMgUtxgGRJO7nMKL7yoQUbsal/9B+XBBFNT+Uuw7wZCq3YKNxY
         tvMIhXmNn4A7qKFQBdSmEVKDUm9CGJ8g/UwJVaWTYKfCmqfeBkPJPOpLMQ9wK4EnfXGH
         hb8qPP5wEZWVsKPXn0zEwQYjYnTkMfNN2l3R0fHkKDJuMBIx0yjrI+l2kIPTGBpfZVNq
         uqEhpPfjTgfAp6cnehZCDLD2HaiACsDVXeBgdHbQxkCrY4XcG8gTPN8w42kiXhcOdcyo
         x36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773911016; x=1774515816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOadfTGg9xXeghJQxazIB0gRjzi9FFaPD4IXx5xRYT8=;
        b=CGg3hm/epuFIykz6+vjjtp2tGxyilSbXHCKGnEoJ7PyMpSlg4lxEco1H68BMU6DXIY
         iCfzeEnr7BbkHWYaZwPt5aoz2cDMVkbLTO5B1A1OvPqecKMUMuwJBvZrCeXCYejp1r1V
         /JlTAn7/3PsGmcVAKWdmb7kmV2DAyxVvyWejGH1Alzh8S6oi0WNBnqlmqA91V3XIDpq1
         svfBVbCB3qHnoClaWrKL8GWwvMuWNC5/DRvLX4dUa4K9s8ocB1B+Hn0Pxa8NZn0GJDEg
         aZGuTtX+lC5JyNBEtACrUA5SFnbUZizDrq46IQVQ7iSjG+L9NMZombzme+q0jpvtmFv6
         uD0A==
X-Forwarded-Encrypted: i=1; AJvYcCXrwfX/h58Bv7mSEZi0XpcJToCyb3RMLPXyjoFw2N+tU8hlEB1tQlzREKfeg8g+OI+JE7LaUTaNqYrvb3lw@vger.kernel.org
X-Gm-Message-State: AOJu0YzBW4rYaCefs/9YmH9dtrs8qkJ+r6bWpVLxeESbDBGbuNyj+8nr
	scEnX2d9C6ThwnTbn7BMxceCNGXIzz88yjNCkESw23DZ2K2nd0tGIVZjTa0+KqopjCZ7RbFcJQE
	gp9KHgXmPxDSj1mXcvL87JqjeSX6MG3vGbpDL/Sq4aeo7KsbIX7vzUd1cDnVdUMreifa3
X-Gm-Gg: ATEYQzzPKN9zr2XwRaddGtFNLTUhmAKQVUv8LYQJtCdo2CLSTFL4FuFyAcfHpvyqa2V
	8QvtyVDNm6XgiGOyMFN1yVAWrIwORgjEvQRX/tB0LPBZcxmjpioyyG53CBvbqIBhZkN9oxRMwb+
	8rgsKIvZF8cl3ybaL8T0oOAsi+FMzDYrln9wX9T/7I3UjYzOJLdHYzVPOMIzglrqZjQdpsNEwZU
	5SRr1SUOD2+r6uh3VXp1oVoGTmeUuvgmHutQ+hiS6+mYBJJF8H7Q7pRlft28OuvJB0gbBm8JhaO
	nC+3EtnXaj+PKGlTVnKACixcXBM/XjK9W1e9ywiSySqNApj6OSlee4g/1TA15LCYB0mUQ7d69YI
	pB6PJ1e0Vy27qlyALjLIJi6HIUE2XDLgtiQkwFI1Uhz0BVBN9x3GLCp0=
X-Received: by 2002:a05:6a00:6c93:b0:819:5db9:6ac0 with SMTP id d2e1a72fcca58-82a6adea0ffmr6222785b3a.37.1773911016080;
        Thu, 19 Mar 2026 02:03:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c93:b0:819:5db9:6ac0 with SMTP id d2e1a72fcca58-82a6adea0ffmr6222756b3a.37.1773911015640;
        Thu, 19 Mar 2026 02:03:35 -0700 (PDT)
Received: from [192.168.0.173] ([49.205.254.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6befc046sm6808860b3a.59.2026.03.19.02.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 02:03:34 -0700 (PDT)
Message-ID: <421a4d73-ce26-4971-b7e3-31919e4ffb1b@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 14:33:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/11] media: qcom: iris: drop hw_response_timeout_val
 from platform data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-7-55a9566ebf60@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260319-iris-platform-data-v8-7-55a9566ebf60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3MSBTYWx0ZWRfXzq9R5pWcI0bZ
 vXRjCjJsOJsfVTNwVRJKupKhAgv9CKBUqkywLGWLYjBk+0+lhEEKjGqKaGsYnFCLu+45KRHHdSp
 OuaBTseLe5B6t83Ue3RGVaqWa4vx5hOdnsXOr8H1uHhJOHuAMjJnQi1622rpTkCLBHhPnvhybSL
 5lWYS8lFZmKoZwPreBgeDn89TvlHVJVbd4zTg5YDOQy7/Wx6yWvosWwRaVXwaJnhj8QG3UdxDx4
 geVdcXZJiDv6HCZNSt49DoucXTjdfhv7bQL132omJ2U7ZWWt2x8hBdv6fdGbYzZlL8OtU9axKZl
 rvUG8iJhy7EhdTF4N6eEpmxttJJs+rQjBtp/R7SSTbYdHkNT4pZqwyAiav3j7SXUxx2XLBcImQX
 K7uIJAskYXp3Fer75SH0U8z7H25HwFsPbcng2OiaOHV7hD0H8U1BpT71NG65LmGrZY4VlaV3j8Q
 Xjkl+ep2Sh7JvoixGRQ==
X-Proofpoint-ORIG-GUID: ayLlYXTTiZZK1et2uupyiLfyWg5Qu1za
X-Proofpoint-GUID: ayLlYXTTiZZK1et2uupyiLfyWg5Qu1za
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bbbbe9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=vmayvKaVtNuonzR42S3udg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Y7rZwOY2BnikIh_CpQoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98675-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3A19D2C8611
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
> The HW response time is a constant between platforms. Remove it from the
> iris_platform_data structure and use it directly.
> 
> Suggested-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

