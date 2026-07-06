Return-Path: <linux-arm-msm+bounces-116886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lt7KEsC/S2qMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:46:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 375FF712289
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:46:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EWy8DPUV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XBClwEHn;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116886-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116886-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44C86319EDCD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54AA298CA3;
	Mon,  6 Jul 2026 14:02:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9E5373BF4
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 14:02:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346543; cv=none; b=oMOj/bVtcB0xUSa8w78h5fvw1X4x7qSvkRlKhoye6m4bMwmw3Qy85GltOZtWdlssgA92JSPqBLrnz+/f2j2H5YnjcDw3QS2KPuM0c+YwcK/9xaHI67HRrj99itfZvRoYBlJQrDCgYqJXgJPZ2VfL0sT6543h52R1prMefQJcKxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346543; c=relaxed/simple;
	bh=awXQ/brJfB9B4O7BSeRN3xqg4Q8yglcr7LBVBZ0rKKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BlnOC4ovMGjVo5HkyOzYAxoXgLGD407faL+V0pqXL8FFIEAaNigHzT0He/PMe/2DtSZcSwsC6QHJKfb2lIRCU+9u+I/apJXCmUfIWNPmeiXmZy3rQUJ1WtpGxgiS1vPmUxev+QdioGLwLZIPPegKmRQ7Q10KqixtJKrlktFDJ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EWy8DPUV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XBClwEHn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxTmr317147
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 14:02:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WSPAKkfSBcG7L+ITRQk41ncN8ei+Eb7mybQoEJRwyog=; b=EWy8DPUVmPeZazej
	8UxWkOZoD3IZYB62rbTYIZ2WAKxhuHfZgsn+pvJ+64c1afzVVVZ3rTfpZ4iMdLi6
	M3ufR8LJeKr5W9ljNVYzOkQRfJ3s3Pu8I6zRiBbr6WxNtcQG32cGGYxGO9EUJIJ1
	iEwi2q+0wLwMJ1j/Z5IzEzHotDVYxRQN/btIBnnD2l94nVJ20oioNiMlA1d0nJQT
	vvp4Fz4mnRtc6Ufr3twJFwKUkbFhGAFHw6/ATrOoEo/qjIc0XoJrSoyelDjXdWXK
	qyWooHeGO4PLmaBLsf87SrSBKF9t2Jrtn5F7hW7iDMaDKgXNwoIPi/lmVYVsTLgb
	AZJkHA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7hm6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 14:02:21 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7eb641eaf5eso3845288a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346540; x=1783951340; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSPAKkfSBcG7L+ITRQk41ncN8ei+Eb7mybQoEJRwyog=;
        b=XBClwEHnz4E98R4Z0Oen7WmMg93iyNgCArjxANA2faDK5zrYaoBeHBgCwpEvsSzr7Q
         CY9AP2ZxMLQ3adAuKmobDZoae/eiMSgT59rZJZoYuMZwVC9XpjXJabhfGqre1p1NG/Z3
         xvsniE+Z5JlqhPIB5OO+s0dlQ6AJ9/OB7PhD0Le7t50ez3PcZJU9CujDKatz2DRgR5vN
         lm6Orh7f1i7Txy0s4nblYRyQPLSgFtGBqPQYaFtDaiWW/lAreNOKCsDhR8/4NuHXc92v
         zKDwg8Ir9Lvj7am8ppbO/lnmq7rztjZ1go3PMe9xttlm1M8OCELuYD4YNiRbveZEbCSz
         ah5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346540; x=1783951340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSPAKkfSBcG7L+ITRQk41ncN8ei+Eb7mybQoEJRwyog=;
        b=J0ItDtNlD6hDNiV4XZfiLC3NhzY4tMLyUEx3tl++mDJ9z/Y/h/5126xuVUqNXmogBw
         XrGQvyOXhW6aGhy0LBNTonX7CKKeW+SuQZ5VKsyJ7A3u5TkWV3yOrGAjXJj/Dhy0KPLo
         uP7XT7XNgQtLhssI6E8Mu6fFGdwaQuEhp3Mdx3Uxc0GLcXNGoVzVAA8apoXqo1bS4ZvQ
         v2j/PW/nrs6TGt0HbuojZzsXimOoSXIirt7mAmH84WhHzLcDnWpgDrvOFNSs/kCiJBnd
         NRs3FnHMTM6tQJzskly4J7ZqKCq+GRz1Mw+uDy3xEe4CMrZOTLR1dwN0LQUUQt/9KcYz
         Zrqg==
X-Forwarded-Encrypted: i=1; AFNElJ+pU0qAvQ4C+y/EDDPcbW9iueRAVHh8c8AImAxQmGTvfrWR+gZwr4CjKhEudnBrFjHuk6HEYP0CTPeeh9LX@vger.kernel.org
X-Gm-Message-State: AOJu0YxBgvYzc0LQOo1WQxS2vHFmn7z2GTJs3f633yC9rELRhb+wIguv
	noP5AvJb6kIxlXHonDX2kK8c3Aozpp9odYz9OWJLWjJqVUEkcZSun0/NlJCVnMtAkmbkEtZG1Tt
	ikMRPooKdvnFmE3NJkYjmO/EyMgm3wp8Ukvs3mm1I9GuVD5yTe7CcmI1+Y+dRt4TotdCxzdtily
	qb
X-Gm-Gg: AfdE7cmWzz8zSSH/SNGxXcxinHs2Q4DuQoiL6wl2Kwz/uK/FzotcplH20cH67Ys32H1
	gspw6z/LfgIAIhV5/mUu2bus59NwASkyRobbhANJwmkhfFeFlndE7Bcw50WTqgxAqJicBd/BG+j
	cD7rMpLbgP2jwwVREuTAtkArlM9dIZ4bnA40TqBkbZtHJUmV5EuuM6PdG00ybK/CKUYg3Q1hiq5
	ztuiF7uUCs9XHS+IU3kHe/YvywSx6INB78bxW4S8dKjAGhT3xAva9SknkEPqvNsjmPYC58xa+0e
	ALWCrdypw5N6O1vsjWIphozeoOSKJy7TtobRmCWzA/Q6Oi4vkF8wOLDGrWd13qoPAl4c/0j+5ej
	YcNkvMs84sdUJ+I+BujBhYHlMf3k0eLmchH76eLnV
X-Received: by 2002:a05:6830:6105:b0:7e9:ea18:d1ea with SMTP id 46e09a7af769-7ebb23bb078mr299156a34.28.1783346539836;
        Mon, 06 Jul 2026 07:02:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:91c:ac0a:690b with SMTP id af79cd13be357-92ebb54cd97mr89390485a.17.1783346059650;
        Mon, 06 Jul 2026 06:54:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm619805145e9.13.2026.07.06.06.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:54:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:53:56 +0200
Subject: [PATCH v5 5/7] crypto: qce - Fix xts-aes-qce for weak keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qce-fix-self-tests-v5-5-86f461ff1829@oss.qualcomm.com>
References: <20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com>
In-Reply-To: <20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4133;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mUG51visYbQ+wh2a+16DhppioDJ/WPq+z6OvDSGkWVw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS7N+9xWGOvh8J6nnK2keRqxOiduOyABq0mfnf
 8snoBaHSxuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakuzfgAKCRAFnS7L/zaE
 w52HD/4rcLQieogmFpH0mB5/k22vmWi+cWveC2sn4J9RwSUWydqUfnN6lZ35u/p3xzhzxzzYf1p
 QjXT3R5e44oUW4ERo6UAzEAkM48LxMESeW2OxT1KBY43NO2nFA2nqnbeAotnSsYNzISLR7xRQx5
 GYuX5VihbOpP9NH7sc7+qSV33LQRu/FPEhKbVUnrHD5zDgToHZ4isD1DoWI3k+855LZ6uFpcauB
 XSgIEUq9SI6CC0undGv0eFXjorKSql+X/i/CQgeI91/IrojI2DNY7C7NzqxSw3ltEbAcYGFx2VL
 vh5Z6pWcYoyQl7h6IFfWvBZUxr/XMMJ8KJNNsk7UFPnz3H4z0Ih9CqcoC3VKaA3Hv15bbgsVM0+
 Eoq9XE102p7BO1LNLlWXVO5ut79AEqklvHNjNMBTu5RqPI6T+/V2nSGBqzeJkPgkMuFoFMyTfUl
 qDGLmIposhnFIIb+wMQKtJd3IkXlgdC+GTrr9gqclcHuA8/Vax5DyT57d8kA3XDWpA9RH70tZsf
 OtyQRhOnHe0LlEZwZkcUJaXHSzSeuPjzhpc2cu9dmcv7EpA2nSkRa3QyQhwKrczR3QOjlo5V91S
 qFRvec72HGQSHVNWGa16PEq1eKkrf0Wvy4SH80ffNc/+G56Rjdq1EFuoYKeSZ5q70caeIDehoHd
 z7qRXe2s9UX9kKQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfX1MzWARy+aDAh
 NG7w9pM9/kCKslL6f1NpRGOOoeRb00kWdx7i3lo/I9pRt9tM1dJtDFtLiI74HeIeLPDLhM7+VBN
 TVBtnAlvQ3kqOmyJqV6rSFT5AMwALqXExH+UbpeKW0ohDMFeWZgocLxXITCN669619tyH26TrHG
 8SBsu5uNJax+B9O1OC81iR1URSoMFIvBW13mNCiw10vCZohHn1SmIi+wXMOtIn/wGmjV1ii8n4l
 YV4JRuUVumdzrGDNaiarm0WCTxYpv/+yqslUoKTSBw1JLKFqfi+zs+hzWco0JQulMwwlcezlB6a
 Z+qRc4J2rAykvLcBhaELkxRda07HcpuyifCtI1wqFIpjkvmH4qmKMUQ6/id1BFhZxMods+8/lW3
 HDZ+E8XaPt6azevW4+GPvdyXUQd8G6E2J1CXfGtMmzUMZo5Vn9hLfw/4Kny+qRTth6Y66mWJ5Q4
 tas5L6p5brGPPWc7ZFQ==
X-Proofpoint-ORIG-GUID: wscM_JQQa03k90LwXCa73UJys1lgEaoE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MiBTYWx0ZWRfX/FwmkLBjzYSr
 MOQZCNLduq9jkClb1Wrr0FQR5i9Dqstpd6I9dD3NdakBru8gOLc1z9kLDbs9lFogOqUa3OHc5So
 iRfpVzd1giJYDQ4bLTK5jtsVLv3irFw=
X-Proofpoint-GUID: wscM_JQQa03k90LwXCa73UJys1lgEaoE
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bb56d cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=tpKvEUOkdOp8HkJiz7sA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060142
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116886-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 375FF712289

From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

The QCE hardware does not support AES XTS mode when key1 and key2 are
equal. The driver was handling this by unconditionally rejecting the
keys with -ENOKEY(-126), regardless of whether FIPS mode is active or
the FORBID_WEAK_KEYS flag is set.
[    5.599170] alg: skcipher: xts-aes-qce setkey failed on test vector 0; expected_error=0, actual_error=-126, flags=0x1
[    5.599184] alg: self-tests for xts(aes) using xts-aes-qce failed (rc=-126)

In general for weak keys,
- If FIPS mode is active or FORBID_WEAK_KEYS is set: return -EINVAL.
- In non-FIPS mode, Accept the key and encrypt successfully.

Since QCE was returning -ENOKEY for non-FIPS mode whereas the
expectation is to encrypt content and return success, the selftest saw a
mismatch and failed.

There are two problems in QCE behavior:
  * -ENOKEY is returned instead of -EINVAL for the FIPS/weak-key
    rejection case.
  * key1 == key2 is rejected even in non-FIPS mode

Fix xts-aes-qce behavior by using generic helper xts_verify_key() to
reject keys early with -EINVAL for FIPS mode active(or FORBID_WEAK_KEYS
set). For non-FIPS mode, since QCE hardware cannot accept the keys, use
software fallback mechanism to encrypt the data.

Cc: stable@vger.kernel.org
Fixes: f0d078dd6c49 ("crypto: qce - Return unsupported if key1 and key 2 are same for AES XTS algorithm")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/cipher.h   |  1 +
 drivers/crypto/qce/skcipher.c | 20 +++++++++++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/qce/cipher.h b/drivers/crypto/qce/cipher.h
index 850f257d00f3aca0397adc1f703aea690c754d60..daea07551118d444d2f749588bdfe2ae2c6c553f 100644
--- a/drivers/crypto/qce/cipher.h
+++ b/drivers/crypto/qce/cipher.h
@@ -14,6 +14,7 @@
 struct qce_cipher_ctx {
 	u8 enc_key[QCE_MAX_KEY_SIZE];
 	unsigned int enc_keylen;
+	bool use_fallback;
 	struct crypto_skcipher *fallback;
 };
 
diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 54ff013e24317cd4d7a0dcde88cef8268db784c9..6d5784760673074179eef47a1faadfab898a76f9 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -12,6 +12,7 @@
 #include <linux/errno.h>
 #include <crypto/aes.h>
 #include <crypto/internal/skcipher.h>
+#include <crypto/xts.h>
 
 #include "cipher.h"
 
@@ -194,14 +195,17 @@ static int qce_skcipher_setkey(struct crypto_skcipher *ablk, const u8 *key,
 	if (!key || !keylen)
 		return -EINVAL;
 
-	/*
-	 * AES XTS key1 = key2 not supported by crypto engine.
-	 * Revisit to request a fallback cipher in this case.
-	 */
 	if (IS_XTS(flags)) {
+		ret = xts_verify_key(ablk, key, keylen);
+		if (ret)
+			return ret;
 		__keylen = keylen >> 1;
-		if (!memcmp(key, key + __keylen, __keylen))
-			return -ENOKEY;
+		/*
+		 * QCE does not support key1 == key2 for XTS.
+		 * Use fallback cipher in this case.
+		 */
+		ctx->use_fallback = !crypto_memneq(key, key + __keylen,
+						       __keylen);
 	} else {
 		__keylen = keylen;
 	}
@@ -262,13 +266,15 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * needed in all versions of CE)
 	 * AES-CTR with a partial final block (the CE stalls waiting for a full
 	 * block of input).
+	 * AES-XTS with key1 == key2 (not supported by the CE).
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
 	    (IS_CTR(rctx->flags) && !IS_ALIGNED(req->cryptlen, AES_BLOCK_SIZE)) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
-	    req->cryptlen % QCE_SECTOR_SIZE))))) {
+	    req->cryptlen % QCE_SECTOR_SIZE))) ||
+	    (IS_XTS(rctx->flags) && ctx->use_fallback))) {
 		skcipher_request_set_tfm(&rctx->fallback_req, ctx->fallback);
 		skcipher_request_set_callback(&rctx->fallback_req,
 					      req->base.flags,

-- 
2.47.3


