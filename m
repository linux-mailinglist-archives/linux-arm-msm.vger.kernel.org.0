Return-Path: <linux-arm-msm+bounces-102913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M2lG3iy3GmbVQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:08:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CFE3E9958
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A7223037F05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB6C3AF644;
	Mon, 13 Apr 2026 09:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/U1GUVG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cXU57A4Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8CB3AE70A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071145; cv=none; b=NMQdh2cFpsDm/SnVpmJXMpbxs3Pb19ZrRHe1TQeZ9kkD/p9eMKC5xu02k4jhGLd7IpxEAToc0y7HkcnHh5YaBRuUvzka9c4V5aa2qBaaz3Hqg5lxlNa99TgejIjH4JI4n2cXpKH9ckMMaKCFNmdsN3wEtUivsTPojiPrLHpskKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071145; c=relaxed/simple;
	bh=HvBWIjEkN6X5RQBn4tnjBzkItJ7cHBZXC8gL4GAHTOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxuo11LApoSv66Ug5dSginJDCz5wBPH689Oargznr+XvkzjUT5CDiO0zirE+bsCYfKVZOAk1xKtiNNJNH0kKC/uM5bQiuGVe4QwFas7Y07g++PoN/4M/Lhj0wWdjiqjIths0te0EpZ5Y0HvftZSNT4zBX8CauHwNBuzwNOjF2LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/U1GUVG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cXU57A4Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7QdTZ025269
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjUBjpRkT+GDE4DzKslbwRJdENH+P4t/nPg+9+ZAdK0=; b=E/U1GUVG9dhseGrO
	zjp7836sfwiLAcHhwbncbt+hPDQKUScdLGb4+nD9sFydXqa8Ni/4LbfnH9AvZ2c7
	+CJkvZ/s/m584Q1VB58ATOgqHlIlYVAJYmbL6o2ZtFmSiaarBw7OUh1PyeTNew95
	guz4xwp2Av5vY2NkopOo2w0eL3a/eBa1nQSD2ZlIDmv3rmBrvuFAkA1F3sIRbd5d
	Knqq6O4RlvFB6nmVnB77c99hZ29qBFRJdmsFDAwBAnhqA9gEtLdJQ5jsC43K2UZk
	DBn+qB3k1BdYtdpd5lM+nOMGMjZSToNA2ZmsdesBLOpU9ruNjG9v0OJ7e37UwGz4
	TqrPOw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfewkvmt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:05:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f0e12d375so1498866b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 02:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071143; x=1776675943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjUBjpRkT+GDE4DzKslbwRJdENH+P4t/nPg+9+ZAdK0=;
        b=cXU57A4Yzxb0hl1d5eO7fVNoLymzVoI0OtwhfGjae7Mr5+qy9HxldhyeK4LGD0ptxf
         9jHgI/i0FOCaMkV1dyBt6zA4wpKvmRtWic4+hGeJzUPDm411p1hQME1Jn2QIFwNSsGfP
         8UU8cWFOPNAq6ZQCQnaES9PNl1KqCqLMNt7nM35pFno0s0F7kZf57XHkO7mmGf855cAJ
         BXU8vozyYm8IRBRlBCh8kKGGVA6QEBTkQfbBcGfmJ68oynF4tO9rzPAuPkpZLdSPl4Ds
         HIUpC5JljvAnQ9gioyZevzS/x7vah99FJn7kXr8T9f4lHwTi4HoYt8TCWOHuYL3OE01t
         mwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071143; x=1776675943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjUBjpRkT+GDE4DzKslbwRJdENH+P4t/nPg+9+ZAdK0=;
        b=n166RuMMO2c5uX4Wy8M+mkyqPIY5nv+mhNjPUrckr5YbDxpTnNv/a37b5bwDu/iocx
         p+RngqO1EDSTuF388TiW3ETY01m6gfEvo/u2OPlvexkWvn9EfK8tSWXC0t3Iz6/elLf4
         FdmZF/WXAHnJUvSD+Qg/KpQ1G6NXVRzW077fvwPy4LIHDhA0Bo8n2rRMkaqLKf3CNr7y
         zY+KNaj8oozcTHf82qzpX9ARI1hesIfWaGUpkMar7niyaPhLFKdR19y2+PWbOGqlh7xH
         ArdVVUTy8zEwnX88GvtSsMFok0GfjbFIK7vLpcSTPUR4BKhyG2V0mSDFuHNEZjRc3JdX
         78zw==
X-Forwarded-Encrypted: i=1; AFNElJ9KHCXovYX85JXIOEkPWIO1KOiL67XQ76fi2XxJB08atUZvlQSZ+VUfJpcGOMDx5e8nYSjDX/X3fxzJoe9g@vger.kernel.org
X-Gm-Message-State: AOJu0YzdZUx1UNDmWB2SDi6ylg/9sUR8qwtrTCJU27wnuOwaiH+Pp16k
	+y9w7VtONa30sn8dkoj9+xg62sFPgnl3VigB7Uft//Uf2c3ek1+SerDex/DZliqaOD8ffK/L9GU
	xPwMor/bdi8D/5cchev0KEYatHPjYT5OAhRHYrN0hE53VSsdWVFTyjV13QUb0yn4WWy0l
X-Gm-Gg: AeBDievJLpMZH/9vhpYfYWrnS6Cs047L/r776ENOWvnNeRraCSVEXD9qYHzm6hUWjXh
	gRX23ZR/E+5eG1py6nZYTwFuRRMLnILO/GSbOyf2caVpHcC+QZIz9EAhfown437UqNb3Ysau9db
	gHpUqi+V9RcXA1X1Ebxw/X6jCSsu5vrVM8E918OzOBxpm9epJnqqViDYPwGOEBTlf3Mh1RgpHKY
	4urhFMd3kdzu1Cqk/yA60V6U3By/DBakP4/cY2wKk5KRxxGwKz5B2H8r7RZzflr8+gaSfD9VNwb
	t0SPbBygBc8a1QGd7xlhxHquTMiAr/K6zRTes2rq6LWi/ndDvajLIQRHbiIH3F5Nxc/sS2RXzfa
	1Tn8sHI0xn2Ndd24KuzeNpiD3dMYIoLfaP6Gfxw/WEVEQR1O0mZMqHMs=
X-Received: by 2002:a05:6a00:918e:b0:82f:18fa:166e with SMTP id d2e1a72fcca58-82f18fa4110mr8670511b3a.37.1776071142407;
        Mon, 13 Apr 2026 02:05:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:918e:b0:82f:18fa:166e with SMTP id d2e1a72fcca58-82f18fa4110mr8670469b3a.37.1776071141748;
        Mon, 13 Apr 2026 02:05:41 -0700 (PDT)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c339570sm10499494b3a.16.2026.04.13.02.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:05:41 -0700 (PDT)
Message-ID: <837cac8d-ef3a-49b4-9f10-2682df2cf273@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 14:35:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] Documentation: ABI: Add sysfs ABI documentation
 for DDR training data
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-9-47ad79308762@oss.qualcomm.com>
 <4bc1363d-5785-4214-8057-4f2a75e0f8a8@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <4bc1363d-5785-4214-8057-4f2a75e0f8a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bcFbluPB c=1 sm=1 tr=0 ts=69dcb1e7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=aPmjE-LijuUacBvKLa4A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OCBTYWx0ZWRfX7DmQoR6/jshZ
 pP2qZxHmvqVHQfAH3k+R5Im+W1QMTOeY/DuwSUoJjtJaRI0cOyxZjW+In62F/Xwuo4vsHcSCnfs
 sRdYLjEF596omvuda6/Hdu6EN9u05puSJMNvBudlT6yayj8rgEWUOv74o+j5qtveafH0531KbwG
 BbbmUSYCHqdgjPuoXYLNaA2IwWI6UFsDiGuu6sW7KMw5AqzsM0aSfk144Gl1F5ebchaVfmBgUc3
 3lg2C3UDaOKd9AvtNiki7vqy3rGHLSDid5Jn5P1OA4pO7RwX2wFLy/AaHqtotCIockhX7zR33Ug
 qwdVVMPjmP3MdXPPZTvArVcOIcw1xLg4xYX0RR8oUK7bZXY9SXZ+V4Hxb/0h4YNI6bL+0Q79Irm
 Ayy7HYlTwofqawlM4z/0+fbiYgxsTd7bIlWbb/cgfnTDBMy6YT/UVnpNuGtSb/fxSKQZFXBoup/
 eKpLY+od3D6czjco+cg==
X-Proofpoint-ORIG-GUID: euKvi8Slp2HCZZPa9oB4Y_EdkVAUAlM_
X-Proofpoint-GUID: euKvi8Slp2HCZZPa9oB4Y_EdkVAUAlM_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604130088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102913-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 31CFE3E9958
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/10/2026 3:00 AM, Jeff Hugo wrote:
> On 3/19/2026 12:31 AM, Kishore Batta wrote:
>> Add ABI documentation for the DDR training data sysfs attribute 
>> exposed by
>> the sahara MHI driver.
>
> Sahara
>
> Also, this patch should be squashed with the previous patch since that 
> is the one that adds this sysfs entry.


ACK. Will correct Sahara keyword and also squash this with previous patch.


