Return-Path: <linux-arm-msm+bounces-51263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDADA5F00E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 10:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E27413AD3DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 09:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CED2641D4;
	Thu, 13 Mar 2025 09:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="mDBRL6Q7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from qs51p00im-qukt01072702.me.com (qs51p00im-qukt01072702.me.com [17.57.155.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D32A1FAC30
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 09:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.57.155.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741859838; cv=none; b=cE+V3MkE/tVnfSEoT0M6Wkj5/Y1mYruXTVFWjpmdtLQo66/YtOop3ksBvpEQdf2bRUmX+bRvL9kgndJlHpK+iH9lRkUMsAw7vaARv+rfvKr4+DSTJDPFPxgWDU79OBxDCOUOuOJeeycdanxQAUNltY2c8qV0za0gfo0pbO3C9Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741859838; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To; b=FM4SFB6h6Pr6VJZowE16sGfrXjKw6hA4tMxbEl0eQlkX2ZOdX25cJbKFLFCa4/nYrbvjn93Ukv1Cy6h5AfEwLEgnI/fPpKT32cIocgm0az1atysGa07eeUdYrNYH+0EDgUdZxFDLIhbBHZRcSNV7VOTYJQ9oNVRO2BQdvn1T5Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=mDBRL6Q7; arc=none smtp.client-ip=17.57.155.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To:x-icloud-hme;
	b=mDBRL6Q7P6eKlGWKmSFzQBLF1DULJfbbQ8sjaG8zUe6FKld1/UlXy0HT4ANdxbrNg
	 buNsPoK034pJW9ahBQhZ5jdZY96NC0Kvr/WC1J+uRGmpA70/EAZRmhfGhijUn+7C3/
	 uAEKiipl9BFCpJZMn1exThuyiTrZUDHpcOhXZ9KWGkHsJHWjxBwlaAVVIuhpH4njNV
	 DEI5pl05frVTOwm8MtzIYe3+ECp/toOWwru5CXyus10rDCz9HnDwG9DtuyPZYsrLiv
	 vXS8wZ9Ry84UgsFl4rPx+9F8pbskWtvGErqcQRPYuRMN6JUQ2NAeWdTjcz1saiZq6g
	 V9wwJTd03UeGw==
Received: from smtpclient.apple (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01072702.me.com (Postfix) with ESMTPSA id 8562C168033C;
	Thu, 13 Mar 2025 09:57:14 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From: edgsrdo@icloud.com
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Thu, 13 Mar 2025 05:57:10 -0400
Subject: Go and fuck your self 
Message-Id: <36A51C14-A7E6-43B2-B3B6-7C2171B1380F@icloud.com>
To: linux-arm-msm@vger.kernel.org
X-Mailer: iPhone Mail (22D5055b)
X-Proofpoint-GUID: shf2JPypfG7nZ0YqmKoRwBgaiNab8955
X-Proofpoint-ORIG-GUID: shf2JPypfG7nZ0YqmKoRwBgaiNab8955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 malwarescore=0 clxscore=1011 bulkscore=0 adultscore=0 phishscore=0
 mlxlogscore=331 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2503130078
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8



