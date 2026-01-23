Return-Path: <linux-arm-msm+bounces-90300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HKzNlUkc2nCsgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:33:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3771171C0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 08:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC06F300D165
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69B12DF6F8;
	Fri, 23 Jan 2026 07:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQEC1inq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/mHRVCD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBDF2DF122
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769153618; cv=none; b=aFU/PyIUE+pYulNsh/Wd3CIJv6bGjYO2V7ztmX1FLCt5mq41Rg+qDlPF4sKGryifcBZBmw5zj2AOklIXY4+zfcYhhiNoR4C1WFPQg6fMUuaD4dlDHEplwxIyQ8GNZ74Teii32FG+ZSV1uYrld2bFDgGiOVGZX+4LSYx0UYjJh7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769153618; c=relaxed/simple;
	bh=87tyDkY4uu801kWSXc2jqH21ZAwb1nV0cmoJamyPBmI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nkBlILbtcLwZf3N+N1LtREcyBA3ur5YwE6c1G88wzokIRm4v4nU2+g9CYwtRfLLl8ZC6b1redPJUWAhdTIyjTPRQHXEK1nEa1GfkOF90egISVcWbbdJDprGO/F2DHdC8mzSOPx3A+xiHYe8T5Q0E2He3Zdy0bt9oW4mzbyJr++o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQEC1inq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/mHRVCD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N1DIMh3649248
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WsdGVScU7J46gfp9UKfHBThHJRFlROuZJLKeSB1KZTg=; b=EQEC1inqzwJMawNB
	ZfL4Aice8AxQ8CHFYXM89nDKF0L/r5aGexkjIHDAARuoClohj7RGL3w+uSf9UQ/x
	0RfY08dPRYwqUI6dkIwMZ/eomoDlhuRiMYG5r+ev4S5fWhV2VPEWWi7W00+zozHM
	vKrA+t4BEVQBUR7/vwsTlZsfHK5mw2ygFt54fxy9sKsV4ydn/5n5l4/09MkKrdSR
	zc4o4mL+hZNY3jMUdmpF4Ct5vVgkWdAEyLmzX3xPmJNUtWVWTpSFYskjgcgW/Sg0
	zxbqjX8luKY9jIvXifC2Gf5beyZ2saSYxs2dcAuAg7/Y1ko8WqyVQ6mNWU2+gX7q
	h7A8Hg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buy4ns89p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 07:33:36 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81efa628efbso1704993b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 23:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769153615; x=1769758415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsdGVScU7J46gfp9UKfHBThHJRFlROuZJLKeSB1KZTg=;
        b=J/mHRVCDU+0lovfpUxjevumPBV2ew0smSQE4pxp+uTKgN+VxwPi5V+ep2c29/xwZXE
         /NOX9qltpCiLGeOBk/U4FbVYe9zsI3K4jHq6Kar55AU5TdBE2H8p+W9yb4su24SShxpB
         7ub7jlMWryeVaYKEnDkDGHTA8N6LpOBXR/sCvtFOMUHBOPrVEJ4Dm/N6O8Y6WIu5oxw4
         ff15FX0J52fbok8TPZNKmO0AoPeROxibIDLpdovl/07zl/RWEgioEp94oAY7kLlkuM1H
         QpmRKXuaHtPsMyCiCGvxQwVocsva3X+ipFhHdOXjzioydcrVxNGGiXxA8GGwOvGRjd//
         RpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769153615; x=1769758415;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WsdGVScU7J46gfp9UKfHBThHJRFlROuZJLKeSB1KZTg=;
        b=k7mUyBocwaVbu1YIMnknPkGEIqQi29eVFL2pKETRwjDKurFyusnheSUuuRa8ozmj8C
         fNRYvwvunFGtu3K6znn91kYhcWp00ExG9fca2VP32UHH/wJ9eDjxCFucHtS33vEOddzY
         mmcgz1nmtU2cmRvNK940DpB81HvW2kZ782vz6W0q86SdCx5hiblK/wxh1kXUV/XR6zYY
         YRvTt1ERhi0RvR47E1LhCWzcqm/y/Zv5LyEPY/xEy7gKjpq2Xs6/Ka2nY0ga3A2C8qcS
         +sJ4WKdjJ2E2zyzWb4QVE1QYo5U2Yp5K2hSwFX3j4fJ1yVop3U0V6RpnRopmXtU5Xmsh
         RpiA==
X-Forwarded-Encrypted: i=1; AJvYcCWOUrp4bsv0eMd7o/w/sa44+SG/9y5aS14KDSgIh1WSJx+t9O3lwHzT/Q+tSIIZbZOWGHUJhzBfv20TeZgf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4pgC6cu4Bx0dWgFdY7x0WohF1fXzWYGOA6wv0QSPsohHr7bAd
	BCuKGmjKJ0/P3aTYsdV21zkxuNZ5yBOYw3soZNAQ3N8cYQ6IYIJvB2RpYCVPXgU9CEQb40N4Tvk
	+fF18MLTQu1QPP0UUgXTSSk+REofJdl1EfiJb2REEWs4C5y2FdjVgv4+ckGtArjOzIy0b
X-Gm-Gg: AZuq6aJsMrJ0aUtkOFLFrCABzwMK00xEEjwFRfh0bkco6lO+PhOiTB1eLLtwcauqxHN
	UDsyHVxm/bxBb1rp+HetgHsm5I5dkMuiLIeBsURJxPcbzrh2dVnT5tbYI0E6HUfjhW0P9UZnqRc
	RAXI4ceBR44MnRIY+Vo855+jQPx/fhOmIRlAR2pwwfKwKikOJy2Y3IIw8Y38Ns2KIX/ExF8HiVz
	I1kSYYr8YnuUanolQfVf/D3n4/rdqq1n+i1SXDjfbYVe/gElqExJH4W7rXfujwqYSPa/y5U905w
	hvcd0zmGJh5Zs4WiJjVvBL7v6gP5JB98ZKGVr7dn4kQm5euDKWLJWKYnVph+FPRk/BhSTlsOlo8
	e07jYwjzb
X-Received: by 2002:a05:6a00:428c:b0:823:1406:8797 with SMTP id d2e1a72fcca58-82317de3471mr1674053b3a.31.1769153615104;
        Thu, 22 Jan 2026 23:33:35 -0800 (PST)
X-Received: by 2002:a05:6a00:428c:b0:823:1406:8797 with SMTP id d2e1a72fcca58-82317de3471mr1674030b3a.31.1769153614595;
        Thu, 22 Jan 2026 23:33:34 -0800 (PST)
Received: from [192.168.1.102] ([120.60.134.39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873e903sm1332784b3a.51.2026.01.22.23.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:33:33 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
In-Reply-To: <20260121-remove_cap_clean_up-v1-0-e78115e5d467@oss.qualcomm.com>
References: <20260121-remove_cap_clean_up-v1-0-e78115e5d467@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] PCI: dwc: Code clean up and formatting
 improvements
Message-Id: <176915361119.92620.17499887137559458290.b4-ty@kernel.org>
Date: Fri, 23 Jan 2026 13:03:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: cXigkrs8J1RLdr-SJDaJ4FC85_Wos4DI
X-Authority-Analysis: v=2.4 cv=I5lohdgg c=1 sm=1 tr=0 ts=69732450 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=CQ9XqwbXd+loVrtDZPPJfA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=IXkOZakT1NlM43P_8ZYA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: cXigkrs8J1RLdr-SJDaJ4FC85_Wos4DI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1NiBTYWx0ZWRfXzCwD3MlAgdq+
 sFwFHRFprvHE3+i7vc7qi0w4i3+6/Eiu+o6o71drqFhjKwiuDTa4qZb1RBs5GxuEOMdOu6f6Qxo
 uFf3D5mW3vIE9Eb4nfgeE0o3gM+kJYz1cr6QnGx76mjOykE/SEishaeMWtYQVfMVdgZncrnxf4Z
 WbVPznRlGKkO/nw3JTms0t+ZaQmBbEhK8GJy8PVwCUTBEJlC+Pr6e3aOccygqKfeMIUhMq/kA/H
 S/KJnHf4RkaNXK3Ahq9cpy2pD+mjawSFu8fq+apvf8OMmzY5z6y2lR0zCbdiUWL08f2AzZ27tJG
 Xi1ExY6bVZpsENMYgsDTyYRl7taLikB7eBWaNQtfF3WxzpJhTFfvdFtEvliuYDjRBp05cBKW4Qa
 oyxitNG5FNFVV9ox69/w69MmuRBipbmBOqjEfQQ8k0tbZdWPfguBrzARLkXv/90Uz8sFAPIm64i
 nSqGS2PPdeBJvwjqAhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230056
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90300-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3771171C0B
X-Rspamd-Action: no action


On Wed, 21 Jan 2026 23:45:17 -0800, Qiang Yu wrote:
> This series contains two cleanup patches for the PCI DWC subsystem that
> improve code readability and maintainability without any functional
> changes.
> 
> The first patch addresses a naming issue where the "has_msi_ctrl" flag
> name was misleading. The flag specifically indicates when a platform uses
> the iMSI-RX module for MSI handling, rather than having any generic MSI
> controller. Renaming it to "uses_imsi_rx" makes the code's intent much
> clearer.
> 
> [...]

Applied, thanks!

[1/2] PCI: dwc: Fix grammar and formatting in dw_pcie_remove_ext_capability()
      commit: 8a214f64554ce4da91f35e7d3b8eaa9674f5154d
[2/2] PCI: dwc: Rename has_msi_ctrl to uses_imsi_rx for clarity
      commit: 0ecd890e3cf54a0586247b9a384702703277e4fd

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


