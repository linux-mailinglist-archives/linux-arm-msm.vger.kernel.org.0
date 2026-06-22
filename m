Return-Path: <linux-arm-msm+bounces-113998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o9o9IPc2OWq/ogcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:21:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3006AFCA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:21:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BeO0oHtM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OS4qUkRf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113998-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113998-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC60430517C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 407E73B52E9;
	Mon, 22 Jun 2026 13:18:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D543B42C1
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134325; cv=none; b=NDsKXyU++HRrT2vgjXvR+xjhJEl78AHy/Hd5nI7dIIhAONnP2URzAL+74tRpDbcmvrKJRc+hyrrUS2GwcaVgjXkQE9u3pjfjfzl6uzFF88l/6oMqjLljkp97KMNw4tZHTknGEuo6+XEk0mRn8uF9+lVkgenpOb8cX/TK7LcHMrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134325; c=relaxed/simple;
	bh=CYY45MSM4ZMotmXQHnMyBcMwgxFxp0g8DkA1Qgi2eCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LpTt0WCcz4JDlKD1iqM2QGRMGkDuhCVK8cX1VFf/MWLl1C7t6hFx/w4tpMDz3tWgianRqTEeTJiDip/PRx4BhmRHTqqddvqKwY/IdIUSfrRzarLWP3hyeGYMZzLREOb6i1oygpL4MbG/l+gVs4FJDa63SFxdwNkamN/XpqZ9Pc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BeO0oHtM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OS4qUkRf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDG6XY1062290
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dh/jB5jnhJ+W/sIx1gynQvHO09FmmOdVkDRtzuKngL4=; b=BeO0oHtM9HzWUcv2
	fJV/C+vBkIfAEhSk9UHDYtRSXDgbvmX6JlDF7cRp8sBV+zRLyJXNmue1fKsCA1+A
	6vD/WdivrB9/56B8QgZ3xtqQq8u1EQy6l6vEkX9HklLK+0Pc2SXtf/5Fp3EQLJFe
	dNUl3vnplDo9NWEqoUwdwYVchSa+H3Rlh0/nbZrc3Aw7ijMxCvyE60eQTdmPZcjW
	ML9t4W7m240HTGkCqf9YxRvI4tj6FaqCb3GIdvSIz+F4nP9bkg6IAp2y2IQ5xWmw
	vLMcIl+lR4e5BL/HW4WDwjVuqhbqOlnSkA/n+DC9qw23hHlkgQqkrZgn39HuAEfp
	aa4ReA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1sn7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 13:18:42 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-96387f0ca7bso1541789241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 06:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782134322; x=1782739122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dh/jB5jnhJ+W/sIx1gynQvHO09FmmOdVkDRtzuKngL4=;
        b=OS4qUkRfEjDXtgNWrjDRBqyoama+hij8sk9xIDJBx9g3tHI1+f9POSddMWRl3aq1Ep
         R7GATF7loRO7XSEibkKbdvCP+XN2QKCsu7KHkNOlYAw4zT6Z3IpudUsUgz1gDIil6JLr
         7UyteJAnmUJ9iUI9A2JOPJOkDcQV1Sip/7XOIQ1KU4JzkQtxg1xAEfY1Ve5dDurrZhWW
         bPmGnT32wlc6/gevid4SJQGmPr3a1ovtJZQKTz8AUQC8QaSbF1xyx2bApQWny+Rht1Av
         y008dRXPD+4dsaJWuinmPfJcWTGPaN5ySPcdxOX70PIaLBneaTZVYrj/3LDkZLvm6UGe
         nmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134322; x=1782739122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dh/jB5jnhJ+W/sIx1gynQvHO09FmmOdVkDRtzuKngL4=;
        b=gZsjlsTFHXokOVplwD0LM5NuGaft5AeyWRgc6v+/K6j+hrxRCc8JLC6n6K+drQBjQ+
         xa68n+hfoRc5h2ynaR9c5UKqP7GXb/Ak9GS/YP8PfUKA+dpIRG+7fkQMRUYI8INafjDy
         gHABGRFTki/j+bW/St6hIf/vz5lv1ZzSCbX0sHZvfllgG+ZF3n91p+tkNP3EPzwPyhND
         4Yce3DEqJgKs/a9Rh4kD8pOL8FO595Q7VWlMpHoBn1PJ49akw2FP6gbKLbsOc6nQ9vGF
         h1ncbZdpRzNLvhCRpZ/H+P+pYZGTRbCn1fyffBcjUbOT+j8ljH9CiIhz1U7eqOQbfzKg
         xopQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UDV4+37JTgK8eduSaiw6HL9PTTnHB9ddICjsQ7iTZoUZzRGEahbkAfEfPCS/U5JjpibA0rVnL62gYwMZp@vger.kernel.org
X-Gm-Message-State: AOJu0Yza1oLl0fRdJF3WK8D8Xhtdg232rReRLJQ8S9fJRsr3R36pKmJ4
	2c55oxxJTpAg9OwHs1nay8L/99SF4xd3wWziVK8OUDe12n7xqCDZfYzJrWgTuacZtfG5ndqmsjp
	7bLOe0Tbc2k5PVuyK/C9bKNmCRh8r9ZAiQYXYUfAf5MDF2G3k8zkWBSbVEPWzb/BwzNv6
X-Gm-Gg: AfdE7clpcauevjGDjjMd9hQD3ktZWCbNQf+tLoxTYTpc6IrlNRQYsivoj2u+CVQ4yEa
	c04V9JTx7nzMq8vofTfqkry1KHmadHpYvC2KtxYdmSXJCJofrRKXoz7VBDUt/lxgRKlEA6+RGfc
	XEpmjHtI0QVr9F/xAe4GOiPieipVzY0WpxhcVF6O9FMr7k3zPDnIJDm5113H4u0J1rOxZbMNnHJ
	LUBJ1R2ZvlIaV46njfw5yGAKx4Pa2Tzo1AC/RZbwDpZybcXM+GaoHB82CZl3MRrWMEMKbWie/8W
	XoR4MtqwVOirRV36uM2FdYACdQLbm54+ww6LuNlGhN8V4iWSCtf/fF6Ntx3xN7eN9tw7WTDz9oV
	3m+fy8PxxsDIzQ6Yp9wPvvAQmjYqO8i25aFZ6eFfV
X-Received: by 2002:a05:6102:3909:b0:639:3b08:d64c with SMTP id ada2fe7eead31-72b669d678amr5888848137.13.1782134322100;
        Mon, 22 Jun 2026 06:18:42 -0700 (PDT)
X-Received: by 2002:a05:6102:3909:b0:639:3b08:d64c with SMTP id ada2fe7eead31-72b669d678amr5888806137.13.1782134321657;
        Mon, 22 Jun 2026 06:18:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dea2:c31b:2872:1bd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd30078sm294083835e9.7.2026.06.22.06.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 06:18:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:18:13 +0200
Subject: [PATCH v4 5/8] crypto: qce - Use a fallback for AES-CTR with a
 partial final block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-qce-fix-self-tests-v4-5-4f82ffa716c6@oss.qualcomm.com>
References: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
In-Reply-To: <20260622-qce-fix-self-tests-v4-0-4f82ffa716c6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1764;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CYY45MSM4ZMotmXQHnMyBcMwgxFxp0g8DkA1Qgi2eCQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqOTYgjP53jjO6eSKEjKu2GG4WuSt/zm2Ko3Wvw
 z/1Zrys49+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajk2IAAKCRAFnS7L/zaE
 w5g8D/43O9RZpr1iYy9qGRZeUp9oyuL2cZfMyc6EXCeBqaOzHxO80iCo9JZEOpCdhx+cYoH5cex
 YcmTjfbwunIUxyz9B6oFM9QxPtQyPqFBOisbaDNbbKWg6BlEP19m5LC7jDSu+tMTAi1bKm9vLyk
 NxAYxOBk4Vut/kZsJLVLuqsbSlnv5sRjk2Dx+l5Dbv7bd5IefDMYAOhsjLOCQaUHvKJ6wZn0HZc
 luc5RK85+W66F5pKTDq9P3LF4dud7zKBThFnJypACM+xlMSaoFMDduOM1WaxCW119mGQjEnWHS6
 nyLZ4Mi3yfLyL/57sxerC5yA8FWifxnayChw+Yz9Cz39rtILc2s0ZljMADtBgJfw0ksTFZh/QLP
 G2VULSK0SY6B/nUYAwKwVzSGLdqbt0I+To1ZDNjQH+LAAkBw2nMCHXbocPK+07tAaFfKcvmAa7i
 J23cJxMExAKpDzRWaZXu9Jqd/kVwLSxNRU4VmLeCRob5/e6l1836o/Yc7WQKbF+K7GbZtWr0AUb
 wO/HEfr5G01jAOCBs8hAdRydRokNpRcDOQ9bT5nPpwJF8WYlblSI3dnn+H4a0gwSuX/sQtM1P0w
 gjkC/Xk0pIip+/MzJ3+PdCwcpvmhEd7KcVYU5VnIdhz7wKpRNfU5eWbNCPm3hzasl4IlY4+mdIU
 BOIiZYYEqj+qT6A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 5-OXr7g14OuPpay9ofje3ABQadam-5ni
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a393632 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vUpbTSJP45I4i0_vGVUA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfX3BtUYmFB+eM/
 rQ1PHK6ymjWRWNXB5AS22NjiLn6wUY3X5vLc9VI1+VBTEz2Cy37WlQQyQYEW7v7DjqIH9PxQ7AS
 5s8c6bW6naWt7DgZLFaGrA4Rgf7HzBk=
X-Proofpoint-ORIG-GUID: 5-OXr7g14OuPpay9ofje3ABQadam-5ni
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzMSBTYWx0ZWRfX1x1QbpwlKNUS
 YpjyzpJPUA5MEuZdPCnNG8zkRMEdIesn3iO8UDGPciFCM3i4uIiQaLn7bNeQcTXjY9rv1VY3D9W
 3/nm/mm6VmTiocHAsnfGzm7pkE6xEViHGoD9/Gbo5QTBh91FCb19nPZaSRiRq6YTInJHFgY2eCj
 mGMWIeIkGa48STZo+G0namRhifmNBBEr+LTO4HTBIbZRxQsrzApvWORum9h+W/Du3OFGOgKBO2n
 XvP5t9sg4JbiD+Bk4/vw0qyCHJwSSx5zRIR6uox9yjwof2dOgyEtqCPy5Szn30o0dHDt6VvMD8S
 GdwNP4TjvePW/UI4vmxEqF2jsf3lNa7t9RMmBo32fzwavfu5b+lvyUxu9YxgHzb3kvYLqywvfhJ
 DrEYW4Yie3a8wh7ZymqcTt6fn3i5ZOUzht89B1tttBzT4GkNfUX5zpSTVcFLodY5KQm8Z36FkZY
 0ZBNxaT1dwszCVUkEog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220131
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
	TAGGED_FROM(0.00)[bounces-113998-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: ED3006AFCA5

ctr(aes) is registered with a block size of 1, so the crypto API hands
the driver requests whose length is not a multiple of the AES block
size. The crypto engine, however, stalls waiting for a full block of
input in that case, leaving the operation incomplete and failing the
request (and the crypto self-tests) with a hardware operation error.

Route AES-CTR requests with a partial final block to the software
fallback, which already handles the other cases the engine cannot.

Cc: stable@vger.kernel.org
Fixes: bb5c863b3d3c ("crypto: qce - fix ctr-aes-qce block, chunk sizes")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 35ddbe03cfcd75db7599a5754e4ff978f3528105..54ff013e24317cd4d7a0dcde88cef8268db784c9 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -260,9 +260,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	 * AES-XTS request with len > QCE_SECTOR_SIZE and
 	 * is not a multiple of it.(Revisit this condition to check if it is
 	 * needed in all versions of CE)
+	 * AES-CTR with a partial final block (the CE stalls waiting for a full
+	 * block of input).
 	 */
 	if (IS_AES(rctx->flags) &&
 	    ((keylen != AES_KEYSIZE_128 && keylen != AES_KEYSIZE_256) ||
+	    (IS_CTR(rctx->flags) && !IS_ALIGNED(req->cryptlen, AES_BLOCK_SIZE)) ||
 	    (IS_XTS(rctx->flags) && ((req->cryptlen <= aes_sw_max_len) ||
 	    (req->cryptlen > QCE_SECTOR_SIZE &&
 	    req->cryptlen % QCE_SECTOR_SIZE))))) {

-- 
2.47.3


