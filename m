Return-Path: <linux-arm-msm+bounces-117412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sGXdMJp+TWp01AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:32:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4B07201A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:32:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hB6Ul9SA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="jgWpj/Fi";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117412-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117412-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 179BE309B00E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 22:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08B03D952E;
	Tue,  7 Jul 2026 22:29:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692CB3DAC02
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 22:29:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463362; cv=none; b=a3AVSs3+fy3aXiPctoVNvBp6KDndDkBJDwhk/8yaU4sgufWixGbt8tVR/KxMjHJN1CssbQdxtQ7YPZXHoz4KQ6wW0FATpHR3Ilx+076ijVpIHKgRe/DRKPwDL9a/3YKv0S8d0dxJBxo+EMpylqpF0+dIOFrW2gzOjfpf1bLtj7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463362; c=relaxed/simple;
	bh=sGfy6DByE8xjp6rASWJ1Ni5Y2jrrt7KAlRpBUyiO1RI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ge+8d+yay2njPHSdU6WGPZRBiosM03anJ7AMJw6XfdC0s+9cfghSYL7Qz4dSo9CzLutXeBkweWBaaBqsdiJ8hYLyj8dAcxM/lvB3HvV0mACfCA6Shj+G0P1oZvCWthKxjcu8tifvcrBKLKxrKX5SeXDBpuE1bW1LtBFK34arkkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hB6Ul9SA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgWpj/Fi; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5Cex518055
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 22:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MoGJLm1F6BtaFU/e+mcWoXq1ksQeQ5SB3AhfoYNRdtA=; b=hB6Ul9SA59EOQcav
	rzmElRwKmAbtttHUKh5PkFR2QIfrfK0UIFapj+l7fN6Z1UxrYh5wY02hW0Ce9HaS
	5inZE0yM0U054tjOj2R3sxl8F1wKdHDKG1vb+/kfXMAPoVKIWNvA+VxG0zFFZ+yr
	10RGToDaREgMXnNt5d1vVFkrAqGdJnjW4ZYvxiz1IDNq2H67n24V/s4j0Km38rhI
	6Zrp8TaFgaxwx1NcBtwGegRSwLg8ExkXmFfQbkNYoncPuUG+CLga85I8qdZVRq7+
	D7a5V9UlTXQDc+t45KwxBumJ9iXkTFUrdQobNBroQSUUBuf3Y3d8HKyHZn25gHDl
	vvC1zg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5sf5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:29:18 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9674fae89e9so24949241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 15:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463358; x=1784068158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoGJLm1F6BtaFU/e+mcWoXq1ksQeQ5SB3AhfoYNRdtA=;
        b=jgWpj/FiqfdiLOTztAsTGjrfwDGQKVqOZkC95mKz98Zv2raylEce5s7ELVwrMrLDS8
         UlIQBAXp9JpSTb9Jnt0oKtanIYvx7II5kV6NfD9hQDXhcg1/EBK4hF5QzgkjsLaW/Rba
         +n3Hbdu9c4TR87cD3THqwwiQDkEUvO4lP/KmuDD3APj66eO51IZOvUIzPOD+ZP+Honfa
         4WiojK+36w0XB0eC942X2gDY6NMZVFH1ganLV9BsAu9U5yn6AcXhoRfr60NSB7DDfLbU
         fJKxMegP3KMsJG/Zswvu9GOslWEh90wGtYSkQMA60MXTkok0hCTgiQOIMFshYSGmRO2o
         4diA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463358; x=1784068158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MoGJLm1F6BtaFU/e+mcWoXq1ksQeQ5SB3AhfoYNRdtA=;
        b=l70atRbx/ySmNk99LrxpmzBKFmDf1v8e1N/vMYB2FOmU1xDakbNc3kz4HdmsTfCvvB
         uGvlsCr5juID6ofvRWB7gqgPpTa+Vw49KD9kFU3Qe+/NKKXx0o1r2ShmLf5/lCnR2xny
         7bjIXpKsmaBoPDygsP9etXJ/MnsFURYQ0cdbe+t+t7pqPiPfF7dPtJG7/r8TxAvnAwNt
         iGmPSj1yhsgb548fTs+CYX43Ax4hAFIm3je5NyYIdgGI0AG1YcD1r5TjdWzhpLDSAnoS
         NoMBF/QkxrkORhKmRUB9P+9hh8tY19vkz4UcQl5doRbJx4lCgF8yShGD8E7trZxUw3Y6
         axaw==
X-Forwarded-Encrypted: i=1; AHgh+RpGMKNYA3dD3xM/7wv45Fq4T5pGgAj/XEYN/oY9H6vFiOWsO8LTHeJLAKWr0bE8Asp6Ub7vlMpG98N8eLj6@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy/Z3TlgWK3imKb8FzY7Rd9NDtlxQU65HqXDpT+7wnfm4lUort
	7V/7pwclCkmfsW7Ag8oSM5Xv6EX7+BEsYzw9Q5+g/hc+cXeUuMnOqfcvgmIXr3P4DSfMNHKxSpP
	jIhuZETHU0LMzWzJgiiQNTUUk3EJqnH8a798WjWl1Wr0K2jVAIre+C2SHfPC474/icy4r
X-Gm-Gg: AfdE7ckTAYq8BeQ9qTwePqUO01PXC7p6M2t9vWa0XN8ZlO9rEPawUZxwjUCr0jW7oDD
	ripjBi95pbgKmOoNZ9K5/bSm4UxaO/LRLJDq0JxdABrMvtIiCs8D3ByUWy+TK8NNhaHVKf/Ffdq
	IIGARZUG2HFF5MSSF0wSIkkYeR9cLEKVeWetpB4eGU1wWy6eZKDFoSzCM5pKVCm1gnVLkjbAbEV
	y4CN9Eb4m2nVEKwe7AXNY446um9Uvy0n5i/VrTWnASGL2z/bwzBNrr8S+3lCxPwRKrZtqwHoMrY
	KoZEWL0hN+NvyN9x5Jfe5FgxTQEtM6aw0GF6oxQECNI0m8xcG1s/pJXI0pynrYB8YwCzzCLQDGi
	QXxvIAyaQiSP9Rz7KbHqpYrE9gAGOs8zUfqm7p2oSfhFi7G/mV1Ocl/zKCw2jsam9z/rDAV7OLX
	sV53bIbqjwUw6mnwPChskpk0eX
X-Received: by 2002:a05:6102:511e:b0:738:bce9:6afc with SMTP id ada2fe7eead31-744b78092b3mr4114955137.0.1783463357776;
        Tue, 07 Jul 2026 15:29:17 -0700 (PDT)
X-Received: by 2002:a05:6102:511e:b0:738:bce9:6afc with SMTP id ada2fe7eead31-744b78092b3mr4114935137.0.1783463357288;
        Tue, 07 Jul 2026 15:29:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:46 +0300
Subject: [PATCH v6 03/18] media: iris: drop IRIS_FMT_foo enumeration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-3-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
In-Reply-To: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4393;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sGfy6DByE8xjp6rASWJ1Ni5Y2jrrt7KAlRpBUyiO1RI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2o3hB6yN+3QWALNg2Tw61T+6/xw+JsvD7mC
 nO/0kXHnyyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qAAKCRCLPIo+Aiko
 1Z8iB/9axDJlTYxr6yDvnDqNz1lUIvm3zL/7AYi528ppAF7vjNOBHd7RPJAPtNZ1KZld2I44P4j
 oWK0XvApmNLRSp5w8km95U0WFoLys0P8UW6AxcFimgS/mv4PwqNU7kyWhkES9IekfhEi0T2TWeq
 k15M4D4nEDaccVx2tjY6Kvv5G5+TY2MWnGlHoj+Bc2PskpJt3ThbqacZxzYrklDcte9x4T0RpCQ
 Er0MHzyqY6woQmiBQpSubqXrW1GJ6/yRCCYBTirudESzhJbNr4radJvDSK8VyUV98ArTZmot1OY
 n0qWkhKTiUedoG3VlIxOrPEGvRgyOx2+7WfRQrqiyR/xdNgU
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: J_WTjoyZwyrv2qZwNZLY712LdnofTVTo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfXyqAQfTI6mNWp
 HC968ovfPXTJCboDjenBvnnye1xC/ofS434OdqrSaJvijZQVI+IZ27UkkhqBU2wHiDJvFZi9HC8
 YBu3ApuMWb7n7CZ6ihxybpxFUfzbScw=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4d7dbe cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Azqn4rg6zLMgtGihcfEA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: J_WTjoyZwyrv2qZwNZLY712LdnofTVTo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfXxsnlSxjWZaZp
 z0ZAo3nrSLjySqyvPklsqr+jAQf0ypsL34pAHwoLkKSA1ulJTo/PVaspnSNQ9/DxSnt2d5dOCFk
 5su6++ugtIu0RSMAIGlEI9pC7W83QerLTfdtuhfo5KrHXJHExMRM0j1IqY+GNiW5macSlViL8dI
 aloviNbqcG21qAKmDCFW9X7QoHeAvw8lcyBsIokP9M78yAqX12x0kLi865tZIfjXy5zL+X0Vsh/
 XDu1UcbiupzynjnY0bzcgkWix0nHDlsWJJVimjQ2C0zlEedhvh4raSdMY4AQlQ2RRWOG45kTstl
 U+1p3O2YL7fNXuLXCvSulET9Rddq3goJntAc3BlIhvftA/PiWjmtDvP8wThid+GWJIa/unDTHeh
 mERtWKhm0+poDjtMN5XJvfv2xUJLPArCP8CRkbRZZ352zXYZ5fwUgNOnivaJndMk5J0ecAgZ/Ik
 JKoPFUg/gacNhtCNyxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117412-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A4B07201A4

The IRIS_FMT_foo defines are only used for indexing values in the format
enumeration arrays. However this kind of enumeration doesn't follow the
V4L2 logic (which expects an array with consequitive indexing rather
than a sparse array) and complicates adding support for platforms which
support different sets of formats. Drop this enumeration and use flat
lists of supported formats.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_instance.h       | 14 --------------
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c  |  6 +++---
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c |  8 ++++----
 drivers/media/platform/qcom/iris/iris_vdec.c           |  8 ++++----
 drivers/media/platform/qcom/iris/iris_venc.c           |  8 ++++----
 5 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index a770331d1675..ffdbbd20901a 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -17,20 +17,6 @@
 
 struct iris_hfi_session_ops;
 
-enum iris_fmt_type_out {
-	IRIS_FMT_H264,
-	IRIS_FMT_HEVC,
-	IRIS_FMT_VP9,
-	IRIS_FMT_AV1,
-};
-
-enum iris_fmt_type_cap {
-	IRIS_FMT_NV12,
-	IRIS_FMT_QC08C,
-	IRIS_FMT_TP10,
-	IRIS_FMT_QC10C,
-};
-
 /**
  * struct iris_inst - holds per video instance parameters
  *
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 961dce2e6aa9..ba91672df1bb 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -35,9 +35,9 @@ static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 };
 
 static const u32 iris_fmts_vpu2_dec[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
-	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
 };
 
 static struct platform_inst_caps platform_inst_cap_vpu2 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 74626b35d9cb..7098b652c117 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -49,10 +49,10 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 };
 
 static const u32 iris_fmts_vpu3x_dec[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
-	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
-	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_AV1,
 };
 
 static const struct icc_info iris_icc_info_vpu3x[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 9e228b70420e..4c8bc7aac135 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -63,10 +63,10 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 }
 
 static const u32 iris_vdec_formats_cap[] = {
-	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
-	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
-	[IRIS_FMT_TP10] =  V4L2_PIX_FMT_P010,
-	[IRIS_FMT_QC10C] =  V4L2_PIX_FMT_QC10C,
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_QC08C,
+	V4L2_PIX_FMT_P010,
+	V4L2_PIX_FMT_QC10C,
 };
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index a945992f63aa..16c52ad07e2c 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -80,13 +80,13 @@ int iris_venc_inst_init(struct iris_inst *inst)
 }
 
 static const u32 iris_venc_formats_cap[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
 };
 
 static const u32 iris_venc_formats_out[] = {
-	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
-	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_QC08C,
 };
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)

-- 
2.47.3


