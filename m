Return-Path: <linux-arm-msm+bounces-96188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPW1E7mbrmmqGgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:06:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E454A236C0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A8B73018F22
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCABE38B7A8;
	Mon,  9 Mar 2026 10:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJIcymKP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QtjxMrZ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2295738B7CE
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050799; cv=none; b=AOd5EZWUige7PKWjqO4D29KVECAf/b2E+2JlFbAZxC4XdyE+qSLm/q5t4yQIyVByrdorb8aPWZbSBpkk/7Xn5NwncLl3MDhFVteUX8AcPwHBxExC9wWD/90n+gu/dFqS6AtrTfc9uHOEQSbz8QZV1iCH+dLD2hvpxZxxZVOW2Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050799; c=relaxed/simple;
	bh=+h7L2CSgp+u57PBzL+OnIyuBtmi9EUy1Hqu+C8Dk8l8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kX7fp4RwAUr6AQ+k8tDOCks49XlUx5E1FPgP+ma4oJS3kCByEVTyF7MdShJbRglytvfkyEszPMpkHONxbSYzB6ZfSr+EvNgDJSW+SYBYohCcoVB8ZA/cXurgV9858kgNXdamWHzJpd/Cw8l1jv9VzK3J7P8M+GTo56xz5AqvinY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJIcymKP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QtjxMrZ/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298R4lY2660360
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 10:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TxhIqJCHnoy5mCJBqk2Hi1
	XLwhfPKYUXRm3bkoCvhSk=; b=cJIcymKPO5die/itTp/rcpHXdGn6Co4GO3DJIA
	Zi/DmKanDTvXRAmM1X3tUrFqOubimMFMPm8jswdh+gNBRgq6qYHgJIWFdnltmiD7
	cYWk+E5un4vAKeTvDo8H9w3SeN6kx8vL9Bcz8vvW5mKOTEhithnGpFivapxxPipY
	1HWploMr+VTkxCM+/fJb8uc+YoD5kqQYUGQ03beG+QvzjKLQ9O9NNfvMCbAhMWVd
	Oi6tp4u7C7eB9uok3dDhXnU9eTCPmlylQBsndKChjLROCJzTPDxuDtwbaCDL7GYQ
	Ni3qXntcg3M9xRpwgWJSgHWyU2MYLlWYBeikU8D/h1qm6EOg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpn74a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 10:06:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd858e8709so922015085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 03:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773050796; x=1773655596; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TxhIqJCHnoy5mCJBqk2Hi1XLwhfPKYUXRm3bkoCvhSk=;
        b=QtjxMrZ/DLA3XZmsIQdKWRmoRSxuXDMLjvFqmKPLlNQltqAg3Iz1dIqI/VTS+OspKA
         6RIV1V10z8ZA1gnulfylkPxsHiPXeIkGffQoYvm46Yjvf8PTqOoPFbDdZrXwqv4BIjQl
         gI22rPXSSYTfycBhyt7LdGQH66S1iJM2W+dmrQigF2c/Y96CLBMhwEGms7bwhFNB7EhU
         ALZGKLs83uY5YsUivwjQ9AeY3fYyeMbr0/ONo3eJ9cedp8u02W6Gd+Hhgfl3nDlxAyt7
         H1Z2q9+DrzIQmYve1qH8aVR9AUI25Irq9+vgLD1tr+ySDTZ5dGbXCFaiLDZsdIIPCFW3
         v+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050796; x=1773655596;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxhIqJCHnoy5mCJBqk2Hi1XLwhfPKYUXRm3bkoCvhSk=;
        b=Hx8aS6/lG2LPCBItn/4Rp/8vNbNVmJE6xeOuGsTgDfJkVx2s/3lbSaYIAID5jwTlyJ
         ncFrrHk1i8V/ajUR50GtnLb8QHLMGklPzibm+nX5iuKILFGMw3i6qWSJEkrlRs6iIrVe
         3RluxYUsN9/WRRpBGdQdcTUaglho63JG2ivC8FwnAhtDyZOHj8mVRA3ayq31G8/MYNA8
         ExSq1xMhFJTStpZSEGeTUdfnJ6q4bTtDqAtUR3aaED8CimKdPva1wjMueSSuw6BEFuKa
         TCRm/l8g2GYFzi87N8vOeVumAiNDHTrxbmS+taGBaoXP8jcLT8ziJ8y2xe5n8ceXC0Ba
         eLOw==
X-Forwarded-Encrypted: i=1; AJvYcCWe2NO/FsBW68+EK6RbFKEHXUzXVxDXuWkHRKc43UkxN5kwJa4CuxYmHUZWfGJXYr3AXBfNSxb75DHSIvgL@vger.kernel.org
X-Gm-Message-State: AOJu0YzU5vLO4fdeuRUzvcJpHiyp2cCxqPEtNZ4pjnXGrbAvqZi1ztp9
	P9uqpoGh3O9oTZeNluFLudcXbNW9PmQ/hn8Md03tdNVhZsDCnGQzbtkdTbQ5Z3sCokOFIaP/SeH
	aNlkUkQxaGL0d6NiRWucgd+oTMrnJd6NxR/H6L1KbyhuBFlC/z88uZQmS24ACQDWTnsKi
X-Gm-Gg: ATEYQzwg3MABW9SAA2ENW18HbzZD4J8yapufF9f46hzpIZ5/oZ2pHoft1k/FV1dZWxT
	WAHkt1NUFhTna20FlBaaUkfzOtbc7DCkiXJd5X5dY5wV5OvGq9qTmXM6kK2wiyokiqjI1CCnxwd
	a9Sr0/CE/qkoG2/ocVjZZMrT6uogZItFtuwEjXDc8BIVsDUsYeeivoM/uQqtHq3PgnBrnunP5aZ
	bHidRIcQdfzMY7tYZm6eTQm9npkKEPI2whnXHRiitg9GEr1qEdpI6ys16gDoBK0Qmu3J1NCXbuN
	4wBga8p7bmgTtYIYSj9qO/PSx2KbYC8PxG5+3L3UQHWmRo0q+zHclXe4JTWVmWHMXd81sT5DE7P
	fServqdC12UDD0awhg8NPNJr2ZrjLUw==
X-Received: by 2002:a05:620a:44d1:b0:8c7:1156:efeb with SMTP id af79cd13be357-8cd6d431747mr1403835185a.24.1773050796314;
        Mon, 09 Mar 2026 03:06:36 -0700 (PDT)
X-Received: by 2002:a05:620a:44d1:b0:8c7:1156:efeb with SMTP id af79cd13be357-8cd6d431747mr1403830685a.24.1773050795809;
        Mon, 09 Mar 2026 03:06:35 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d973sm24114052f8f.3.2026.03.09.03.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:06:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Date: Mon, 09 Mar 2026 12:06:16 +0200
Message-Id: <20260309-glymur-fix-gcc-cx-scaling-v1-0-f682c82f116f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJibrmkC/yXMQQ6CQAyF4auQrm1SQDB6FcNiKGWswdFMgWAId
 2fQ5Ze8969gElUMbtkKUWY1fYeE/JQBP1zwgtolQ0FFTSVd0Q/f1xSx1wU9M/KCxm7Q4NFRW1b
 EXXU555D+nyhp9Wvfm79tap/C4xGEbdsBHZMP1n0AAAA=
X-Change-ID: 20260309-glymur-fix-gcc-cx-scaling-a0b350cd5741
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+h7L2CSgp+u57PBzL+OnIyuBtmi9EUy1Hqu+C8Dk8l8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBprpugQgSykLIRd5OA8KwZVRBMcs46YjNaxotj6
 /8CBVlpDpqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaa6boAAKCRAbX0TJAJUV
 VtDVD/49DczuCRsbnq1QhY9mqQhdBVah5kMS5xaxVLOaJq0N8oxiaBoU7x2CB8c/c4zTzIHQbQ4
 IluR2CUhg0d7cmODswmEkgEiKrg8+ty5ACZU5ue5qHkpuXLNgKgvCGTUKFIO3lkIp/KzyXMLoeX
 2FFfgkm2+In5COAYNHYq/u4SrW+Mrs20osTAeISkQtp4E3iCCE8fI4I89hyQMVGyYIOahUwozMv
 YTqAoVlRi9mAauq+hntKp99xCLxIpBM1LgHcDZRcN5n9bF8I6hh3AfbXBvka02ux4LtgDXh/tJW
 ia++s9FL8jo2ywOpRq776RgMQ7goFrz/43TCdlmbcbsVnryAi7vNntCkGplc3V7zZNyG4Pmwv7A
 8+fxXcApHFH8B8b6hHLyBukdycjH7uCojjPltfCdx8JtcnbGgGGznDVW53h17uNTWkbUZ0TVgYo
 Wzux3Dwjz706L7TLF1dEXEDXUzD3mh1VWyldLAyP0V1egQAQ0hh+YiNw62fOG4+zlLeMYFcw0d3
 90AY+zvh5mTVX0Gk9BVopLKWnhNa8bGb3VXCbVDzv6NmvJ9jaOFe+//xvnxT+cRZOHx6tYhTRaL
 +ncE38prDG4NgWPmpdtwPLHnyaUzaJsLeXZeGvbRc7Qib34XoSjqUqunV6sB5Tv4RRs6bLPoY3d
 6Gu+1m1FbebcGQw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MyBTYWx0ZWRfXwuDLsxc6/xkv
 kTkYlu6HQv0jIgY6reqsEE++uf/VTxcvkElJUiP+jhvv84oj2ZUuNlf5wF0AjhKNrUSJYs0prug
 gdrnrqga+STQ5PuNXDY5iPaY8nqTRp+UE0tRH/3Qrnr8JZXHanrbzaEIZkZypl41EgHjmKH0tdi
 IjIS2rb1nQAPHDAjt4Q5Xv0hycSWCrzHNUekLxoBVbS5yxtWyRebhxBtIg+EfoaOVlx2wtvnx8q
 CqeD0u6Wg+ljUBEgjf9+xMzePve0ovY4z7QTL77R8s/POGS2NNJouMECXi9khj/OKfC0DSfmaZ3
 PRA2YNKkzX/PdHSv5f9zQK576uBntTYhRYulJKvJFEVyRyYJpHvQ1HOc7Ay0xMc/v9PEgveAv6l
 RFnz2OyIc7WTOYvjKX6+shgHnRkDM5N+TLVHn/B5FDf1Opz3mK63YIlAwtx4WyGTZZtGMXXUIgx
 g/Cq1Op5XWukQpqYtOQ==
X-Proofpoint-ORIG-GUID: X7xfFtM5L5AKxwKo-lypunvZLqx2TYmV
X-Proofpoint-GUID: X7xfFtM5L5AKxwKo-lypunvZLqx2TYmV
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69ae9bad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IArLRPCm7K00oMWsbhAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090093
X-Rspamd-Queue-Id: E454A236C0E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_FROM(0.00)[bounces-96188-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.949];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The suggestion of having the CX power domain tied up to the GCC
controller started here:

https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/

and then, for Glymur, it has been brought up here as well:

https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/

These plus a discussion off-list led to this patchset being done.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      dt-bindings: clock: qcom: glymur-gcc: Add missing CX power domain and required opp
      clk: qcom: gcc-glymur: Enable runtime PM
      arm64: dts: qcom: glymur: Tie up the CX power domain to GCC

 .../devicetree/bindings/clock/qcom,glymur-gcc.yaml         | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/glymur.dtsi                       |  2 ++
 drivers/clk/qcom/gcc-glymur.c                              |  1 +
 3 files changed, 17 insertions(+)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-glymur-fix-gcc-cx-scaling-a0b350cd5741

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


