Return-Path: <linux-arm-msm+bounces-118011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O1fiKwGwT2oZmwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:28:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB16D7323B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:28:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DVBOweLn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KrqcAauz;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118011-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118011-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93BB83059DBB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8A7317148;
	Thu,  9 Jul 2026 13:42:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A612F3C1F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:42:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604528; cv=none; b=ilhBWx6OVj8wNZN+2fkglNlY7tbyhhUQ41OCuSeXRUxC6c0+7vJ+VLIv7e8QRjlVDjBGPaUhOXlhbdE/pA7hZO1yoy96GX6FyGbx0zAohGaiw3CJbNizrW6VWV5ZbpvZFn0DOzGaSgBABVxJA9yFmkuI8FNTscb9wGoHgENGR98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604528; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHGXUq9rhjFF9nLH+lgHh23rzFPd2Kh069T8UAdk3VfvJzx2CjX6ri1MgaXbXW8WO6QutFPaQojjYtkpSudnnp8xq7nU27f/KDYD6BBnMjXgn8Ysy8BevqnsQBcDlcEBPLSISYNdKjoy19i/nevUHi0iQ8doKEXuyPFinO9fTn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVBOweLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrqcAauz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BN1TQ1656983
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=DVBOweLncCEeuBQp
	aJn6atifK7NkVSTcYRiVTQ13lJlSI2gmjv0vWXDHXSzcINvH+vOMBXZ+RmW0NqcM
	w4b/DyqYNWPHOXUsoQj0zWJoA1sZTpxiPRXD3cphnw/sVjr2kbDa4KNOyM+hmAuz
	gig5LvdXjvoJe+tZQde/6cZYdaUjl+fSwF6IvcR/8GZOtYMirHwd/kMhqwESLWsn
	iXs1mMBvqyOD+BYuFWKieETYus3jFc/Vh4s/FJnqxZcQPUMITasdNkGGsWGb+UgI
	WcyKCpwtYm+AxyyrradSbc5vkDPrgJzqYToqUH34zPcQWG+VWQIUQUykhEAxARVO
	Mhf05w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3suup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:42:06 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9692bdab0c2so1006424241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604525; x=1784209325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=KrqcAauzIl2Kb428LBZm/HnENWqzsncN/WZ6j/zfBLdwYCPWDDgifyVkwtZSSIwDsB
         c6LV//6JA1Uer3J+8JWXXp228lRTvPrb8K+I+hL7PR4mdWLFqIe8i5YC7I4acIAX8oxB
         xe21vckOsBCuZ/F75KwTC2BRgDLko+Y7kw7ex/HU5JErl3JW1oeJ+fhEYy9PW5MANq9y
         uLoEAvYdi5CDF1JFA5jkVXfb6wMZqRIGfipt9LGxDlY3j9N0An1U1oSXngTySJtrBqBt
         PzPpWldepgXKsIFQIpQfhqnKtbuwxkuDQQ1pui3Bni7mgwvY2+JFxEbphhOrO/4vKQkC
         7b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604525; x=1784209325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=ncbGUEdjHOAvQ60dIL1MU5qF3D4nKyDq11dHoTZXn8MaAYyBaHbVBJX5sUDUSOSsfP
         sK0e3Jcm/lX0TdM9lbCelr/kAePSlixEL27mpMHDMCHYHWWe4Woi6eq/7S7PdRiKW5tx
         M8LtORCqu7NOzjrqpPLFgstmH+yBqrgSuZOQN+leNqdIpmwCz1Ep4oizzV6pHIc9MgZc
         7ehTb+XW8S8/BHtnW2609x9PdpTvKo+iD0RbGfD+cixNttBOhJs/xImYSZ/am1HS7Wdn
         vkBcROHHGg1uFAh1s9vHXbhzVhM+EUMOIZLuhjOy2pTg3kwwEcjBAhakVk399e66uFNY
         r3Zw==
X-Forwarded-Encrypted: i=1; AHgh+Rrca2ktZRBxQm9D2xvjMUQecyCI0xS6yUpV4UxlBm67yFnKwN4ekXi5i+17m9n1v6mAVENbLbnuIGXmiUs3@vger.kernel.org
X-Gm-Message-State: AOJu0YyfxZafQolh5cDHdub0CDae2X+J6mamyveXTFjRcxHXSfS5OFrK
	laRngJnkTMj90BzS+6Kp7RXrLfv5DkQSw724mMMvXvEy6ZXK2gGbrAMfIVYbFy2J8XEloxBVLZ9
	mrEqJDInEP7fhVpSUNccKi8ArshTaWb2Ann7F7VqYIFyoktrQtxEkPzy32H2LmfGtCqrC
X-Gm-Gg: AfdE7clguouseAKNgKeUaHD59AYFgY5AhdJiVIFL12erysPo8T4OQSCh9U8UQvByyFY
	csUu9/X5oPPdD0P2+I0ORgU+scMxmPWW67KaztteMVknlCoDVIvC00PN/gk0QOPbofErRA+51sG
	uOSK5xLCv+mzhfCgRTZTvrJEOmRMvk6vztpaxk1m7cRvWz0LD2/UL1Bvx9Kwvdh3/jIItWQwQ4s
	gzxBE6IQgPkZf3s5gMKTLBFe0j8wtxeH48haEpErSaQ+23OjM1oQGCZCakQOBA8iBWOyf0QNEBG
	oEODApWP9QTPanP80hadCLlWqDEFPDXSxFpnlUslO9j4BIqFe5JGMNwOHX23V2bLoteUOGZ1NWL
	KkPpaLL04lOiXncZsj1ZuxHCU0FLGYhIAbobXXgtlZpAa4aOSWPuKjKEd3lIShOQNHHmTEFc75q
	ZfK9WtdD5Jkn7y+g9sXl/V91Lm
X-Received: by 2002:a05:6102:a1c7:10b0:6cc:e6b1:7f84 with SMTP id ada2fe7eead31-744f67bda98mr964030137.17.1783604524954;
        Thu, 09 Jul 2026 06:42:04 -0700 (PDT)
X-Received: by 2002:a05:6102:a1c7:10b0:6cc:e6b1:7f84 with SMTP id ada2fe7eead31-744f67bda98mr964017137.17.1783604524468;
        Thu, 09 Jul 2026 06:42:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:41:53 +0300
Subject: [PATCH v7 02/18] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-2-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UkTyltGm6klk6UVSEKXHvenw/SwzjIU97dy
 buovZCU3WGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJAAKCRCLPIo+Aiko
 1ajjB/9eEgHNKl+uxgKqYjT7r1nLgFLRKkiwjoiDtq8fhPz7YxiolvrPgmBDy0MOSldgFB/Abez
 Y4heJx0O0QUGlSbqFm0E5SOkNdGZPH0n/gBHSw0odJO4IlJfVCT5geAxu+OQjvY4Hl4M83oU+1g
 SHRGiX5a5uvPYdU//Umfj2sdNaqfxgeF5RZ3KXXttMJaXgVMdZFOEbMRe/hV7z1p9ORVLE903YG
 bUv7bHqBa2qO78Us//3sMcDrSQ2lCkOu6QBI9Y+Zp6OABzdPXCao6j8ZhQeR2SOtyUb9PYId+rR
 aJLU6FW77WWSGAf3mG+FGgXvInXZTPitZaCwuP9hWgA+2uTM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: LG5w5bEWesiVtVTNOG1FU5LGUj8JIbmk
X-Proofpoint-GUID: LG5w5bEWesiVtVTNOG1FU5LGUj8JIbmk
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4fa52e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfXxeVR+NDGY7kp
 xU4LhTtleLneFkccfAiVo5n2GEaRv02pXnfGnl8r3V8+RSA7uOeCMrAuf2L4rvIJBCRI9SnaDxD
 tC7zDGlAlPZ46VCZTLUlCqBqI1GEqHA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfXwZWadeW+K3K4
 Vqn8TvA76c+hAac7ymt6WNKBDHdCO3V/bpHrA1ksZOrSJEPpEUmx5oRu9ooQQVUB/1ydlkcm2cI
 lNF340bLKfBxTx5EY0urZs81ZzW0+ck4rOqICQ9me01pqRmbtQqjDpxUVK779DnuoOy5UtLgIdN
 4Wjtd7HZ36peKHXbMD41XWofc5ZxyYYwSc2bYAzq2Mpt5WPHIHbEXqf2PrYHpTxzOypcGKM6gde
 i2e0JwDPXan6/09DT5mite/By5Pd0jFEuG4JqRrUSY4+q3hJq/1Vbnw4k1mGgGQBzD4fjZ0+Tpv
 ldcsVq8DGtTymBncpj/bWW21KSvdw7/tBg2c/TTc/h1qwIRqCIGLoes+cXlv/8JOg1F6MWBKzxa
 83r/zKeiQ/UDEkz7BZPPv1mhw9nzpZUmlpjZiWCDFTcIEeL3scQlqlmvULJa+FwU3BIm0/W51bh
 NGRpc8I+1cB8HRH488w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118011-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB16D7323B0

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

UBWC configuration is not applicable to all SoCs. Add a check to avoid
configuring UBWC during sys init on unsupported platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07..6e04175eb904 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,6 +140,9 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
+	if (!ubwc->ubwc_enc_version)
+		return;
+
 	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,

-- 
2.47.3


