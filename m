Return-Path: <linux-arm-msm+bounces-117411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xCUwFoJ+TWpr1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:32:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D3B720189
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 00:32:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NiIChZki;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cLy6R5es;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117411-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117411-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A57B3088F22
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 22:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625FB3DB325;
	Tue,  7 Jul 2026 22:29:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E153D7A0C
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 22:29:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783463359; cv=none; b=p3Q3eMn553+FCkRICn6oBNRd0yS7CaIeAfCw0yMA28Wb8pvNrF+GwYJAI2/c6BEpjBgE4rvx5A9knA7P9CICBdWefLxZl3Cnv+lR4wf3Sxmygd0En1DBBtpi+1od3QlPLpnyEKa4P83ePNQmD9RpjBpcv0isfkFk6bnIjGQl6F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783463359; c=relaxed/simple;
	bh=aFCxwN+s0nObB9dYmcqshZUCs9EjeMcuhwbHJaldKhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Je5oM2hvr0ZGfKmKNIIkWzIxaR7A6Vn5ksy4S+7PF7V9AoWJj0L+K6H73DoVOL/9yQ2pq2S0dBMeslA6zQ5zxLLdjlicsZqKtdYgUV8aN5SVwtGLazfcebbENW2/uC26IsBzmydoZTVvAN+0x1lDv7Ji2fBG7a23kF4vumvTY7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NiIChZki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLy6R5es; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5Q70490909
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 22:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=; b=NiIChZkiA9JCrQx1
	253QFZ8kOYXy5njNkugfhXY9FCl9gcnEIDHEkmE9kLnBdD0OILsWD8HhjYMIPvzr
	kFp4DHcIwCwGm/IeAeRSPQuaKvs3XNMy+4/0eozj5OiQv3rg9Fv46xOJSZnGe4wB
	pH578jFfwN/C/ShgQ8BNfHmu9kD3So9YxaQ8vMJjvIjUPjGQuYUCefq7tBXbUmXu
	Qa/MaFGke/1jGl6PI2dLog2oRk05a+RevFAGTXPieKOtnroJImoHWyBa+wEBc7ey
	npHnrMVaFAVqxVl+3DMch7N1XJA28q0EBq0Ll+IpYCIN8P6H50WG4q4/j1f6Y+Nt
	IAmiPQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9ac2r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 22:29:14 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9693c6fe1e6so89316241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 15:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783463354; x=1784068154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=cLy6R5esR6tezHYVwHxY3sYi6lgYJl+ClT5rW/MYdNvczWsfUT97dGG6iLU1hSHz4r
         1nV3s5SX0E/Lc2B3H2UnC6NaiwXNbJDr2F2IfrPvuQRJHm428whD9TUTcFuZtjHqVfsT
         7/hvyU+7zx8VgfYz5BuuKWPQ7w9e7Yx8ltiKpvFYPy26xAr4NJtkTcQevDL1Sz62bLS3
         I9KPA+M1kEyVqwywPb2DXZZtGlSbebSAOti0eEFA0RWlNjIemxMsaCTo1T/1eezR7V54
         jofoOrP9cTO3YTOZeuDHYLAsSYy7IIVuC7I9wDqRhrvpSkzmfmckXZX1kzkdKFzPPz2V
         G3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783463354; x=1784068154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUFPN10YozDbbYt5j7NhH44x2aT4ZP340z/Eg0bq1Jk=;
        b=oqzDN+GPEISpwxXKiRdIb1RIPsxnLN75TBZBgz+sshR+9xs6e2GXM1bJhThChXfnDt
         +VS+P29okMvUFpYyViNAULzdQhV6fDLjXpCl+DhlQ9U9GydhwVgeZ3zAFoiud2kazrMb
         2o+3SwD5yAsxqzffhTT3jPN5nyOHAhSYTxm3dY1P4j6WchIDS4ZezMWj2NU9iABrJzWG
         3GNiz4X0s6C++p7vuWdI/GuoTDDtE0Y77ozL7kUmMgK4DT8vxod2Xk3HjbDIPX8J/FbN
         aAMJmRuFLmDWGX7YzjY8LMyPhL3gPFumqNQlOtudcleaD1aSWG2fYGHlJlvJAEshAZOC
         XVcg==
X-Forwarded-Encrypted: i=1; AHgh+RrbbS38zI9FBVpwnUgUVIdtXe/qsFexeWyHWmO6Jr6teRoIPitL5HZa4cz8k6bWUdfYIuZWJv1QWcHVnt4E@vger.kernel.org
X-Gm-Message-State: AOJu0YybOiZgbZYfc+dEaIonpHGXwrkViV1PoZ0F9JIS5QhYVcEvHywT
	TSCOX5i1i/AbZJ/4MrSalta5GNleXu12iyoKxj/1TtQgxoKMMTVLdCg8Sn5wlTMYwecBjKZofmC
	gfFKH4N59wwHT1xk9o69/g+1gh1a7tdFMkEHfi8Gv/uEvtyI69z4k+8cF7Q9v74PHSbWM
X-Gm-Gg: AfdE7ckZ75/hqNJDe6caJfZXP8UTpAb33mkVgKkAlVIrDkmvqUlIgEDRd2wvH1ZOAIJ
	/swqntEMCsBZdpFXcp+HYX1YOkVxZUzkVPCnXxQSQqFdcfqQBILDhnih8zPv2F+57EFGM0YrPcb
	C07h+171bGP3DlLlQLn0ld5Vg6Pq1k7JC2Lxugpger9KVBPwBfZgBD6KdUZMjYRpYBtu+YII/AF
	6P/Ykzcq4F6Q4e0FP9pEVgnJfACCkmErajEIU/v6XY7svhFMHo4e/0i6QCHoVL/y3wTqJDUHkk1
	jXyf4iUOAaeJJQ4p67Vyy0TwBmNk+xxg1b7xpDovkGovE3X8l5rMz6AYGNMqjYqkxEfxCRtM/G8
	765uaI4iru308TZauRIOhJJNXyNbunRUiKyk+ug0Jl6mBhl6Ehm8W9EpH69MxYTA3d8umm8YyDi
	rcKBXx4ryVqIlfXmjhcYTy+wMr
X-Received: by 2002:a05:6102:3f8f:b0:73e:751a:167b with SMTP id ada2fe7eead31-744b7ebf61bmr4629098137.29.1783463352865;
        Tue, 07 Jul 2026 15:29:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3f8f:b0:73e:751a:167b with SMTP id ada2fe7eead31-744b7ebf61bmr4629081137.29.1783463352477;
        Tue, 07 Jul 2026 15:29:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c7312bc25sm1897231fa.40.2026.07.07.15.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 15:29:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 01:28:45 +0300
Subject: [PATCH v6 02/18] media: iris: Skip UBWC configuration when not
 supported
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-iris-ar50lt-v6-2-374f0a46c23b@oss.qualcomm.com>
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SkhEj21efbGwh1OhN+7NneptPnsqOcydi7iGjY56ptE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqTX2oNMyxvO4unLEvy0svWQ+MNdp2GtSPxwBnI
 KQBAEc117yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak19qAAKCRCLPIo+Aiko
 1dJwB/4wyu3PSujBNfXAb+8LzNzBLXNEbiAaJ+D15/m6fq92Fhilpdoaman29BtzO5jYTReE+Fh
 g3uiwHnOlsaJUxPWYY0IIsnaRMZqi2buGGfqBPvIKt4NtmImy21N56c1fPXoee33GZoFTWm9Ny9
 BnqEo4KeTMmPjNug1WD5NfHyizoNYGPr2zFM0d5QNZM5aK+jwNqqS3bQrKXj9IhlIICwSUmTW3q
 bezqbqRCWm5eMB/gA4c3L6UuGu/gZeZ8TQ+7JUHS9qM7H2bXaStZNmiVMcgz3apWZeVkeOVH6ls
 fYtpK1Rf1WHB+Jnk4QTq0J/b0tamgbFxOjFduS/8AkcmgymJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Qj3_gIFzFC58NafllLHvR-tTuzjHZ9B5
X-Proofpoint-ORIG-GUID: Qj3_gIFzFC58NafllLHvR-tTuzjHZ9B5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX71VdD+0JnaMS
 NTRF8Cdip3owmoAhpKXmT0j8gB4QsfSE1P+azaFTBZSJf21oL0R3NFqmprxEmyWLn5RbXdlMiIV
 J8PjW2J293JpVayHSpjkpUkM+eM/3Ks=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d7dba cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=wrkyJH6U6m0Jdbs6q_kA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIyMSBTYWx0ZWRfX23Bvz+yP0pZM
 fobF4y400RccXu12gv4BPhSCQ3zl6NZ2EBhPyQH16oB164u7IsowuU01HgXUmwsisjPlCqK+Rfg
 LtlmOc0GYCRB2CEbca+CYFfVG+8DrPCTwC1l+tm67+M0TB5WLSldJjQ61XOk9X7r/UGjkvvKvb2
 BSdFXK8OxCtbMMmJi2M9bnKkR95pxOwMUbaPSvis/bwAjIJZ3sVCFRyVa0skpOnHc0Rma57W1fP
 rEojOBPiG2J+TWW/BJxF1nREgX1wgsCF4hV5JMSUcR/4oHCXxocJK40PcNxW8o2S+DzBltSpLt6
 24JpB2CtuXaLZ19WIbuuO6rTHVwTnlP7nvGUC9xC0uMMv08Ibw6dx9mnip44S9+k8K4GCg4EKK0
 aB9NYm1rgQCmQwFE8GIiZBgVNgezJILEXV/b+xwrqg3ePBckgkarKNQFaLaTpZIYt73Gpl1eWoD
 KWKXM3wICDh3k4UrYDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117411-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:busanna.reddy@oss.qualcomm.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:dikshita.agarwal@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1D3B720189

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


