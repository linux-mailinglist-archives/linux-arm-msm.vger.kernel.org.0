Return-Path: <linux-arm-msm+bounces-108711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KI5/FeqUDWoMzwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:03:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E8A58C0F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 13:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEC033048568
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 11:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EA13DA7CE;
	Wed, 20 May 2026 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ic0TwDnK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQ158O1G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E1B3DA5B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274915; cv=none; b=m4X+pYSXkcedJngmlKfkovvUbbbwRwZpRgZ1+i5iJHvgZxahiPSYLNa1tMetut90Dwx00gIinTSCyah9l2wfTNyust5rpEvpznaRk55deRQczl9UO4+PApS7iErQ0SwTBe2FY/wsroNR2rkNY8gxz7257ti2kajGU3JnLZgCu/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274915; c=relaxed/simple;
	bh=rZymK6zMzN6GZk8l3iT4DzVoSNYOOdaK8F6aD8UoJlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=daNhMoCeQ0BslfSUYbf1v4hGFZCROhIkZJEWecRaWpLCuUuBGPTPsTY+XH9NFWm+ZjyPPZHECAD7/kvUopl95iC8gECTgqj8Vxu4xxq7P5x2SPF7tfIb0VgUTQGNy1WKN757AUAOqiYzgpkB8ZAbhmCtzQ0vKHvfHoFGYnZH8pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ic0TwDnK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQ158O1G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9lkoc267089
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LKHvX6tqS/qImne6H2K8InjGHU4hq+riBpBr5o2VuU4=; b=ic0TwDnKzGanOxm5
	RbcpsQH0HAe5ZyWQRw7sqVkw05bJ+keqYSJF2LZDUc6SQrd5Pwb/CEneMHcEIr+J
	x1bq4G9NB/clpxvTodj59FWElxGKva/PgvoPuCCZ9DsXE02i4Sf+SA7O9NLWN+R6
	GG/UQv7IWNLQb8mroFMNB+Bu7e8r5tfGM6EhMRSm5CgR2cb+NRXtN1LmJatz5le2
	f7S44CYXaxYFRoH03VQHlHeGtqfPhvlkAqybNlcn99kTYkGbwlW+h18qxNj59yq7
	INlLVB/6UNBRmv2LJn3uUR6ADnKv0ED4YOEeQRcoxICLOz/Og6sJ6aW8bnZyaobG
	EjEC/Q==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9amxr8gw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 11:01:53 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6963482e03dso5844877eaf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 04:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779274913; x=1779879713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKHvX6tqS/qImne6H2K8InjGHU4hq+riBpBr5o2VuU4=;
        b=NQ158O1GLbsm+1ILC7kZ4nTfwcE9JY6TqcmEOjjTDPuu60ZibZfWAIg/7DzVyPu/lg
         KeXweem6vmnqQmMkr/9qJtecbYYy9EnQTSjD1uMAK/d5DtxuFmtB1U+UR1NUBqBJrAAE
         8wyLbLjjCSWcSxKLHU1X7JGXBXkLIHg2CrEccQjxeDR1KNNxh4uBuWj8wq80UplF+I8L
         JDW4v6VKHOuzDl0La6Hr+78skH8/Jc0hgx4jR//1AcrLm/gfohx2c30Z/y8Ggl6hhj04
         GMEFk7vPSi4B5wLGgQQmLYbsVL4cJFXELKPdDjtxKJUx3nv2bKAk14703Y2eAcX74S8B
         iWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779274913; x=1779879713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LKHvX6tqS/qImne6H2K8InjGHU4hq+riBpBr5o2VuU4=;
        b=A3bBqelKwpdA0KwB2fO6L7s3W7tQniLANz19gZ3Hv8sps4hWNCN849Kfhmta2jyjQL
         nWyqh7hJu4v6gsQDc+9+U1+zfZfPYCDKLsWHPciGFUzIlPydDNrP23dq5vDYczagQhT1
         JXRwEK7lvRVbLG/dt3dzcJEzCez/v1eEgYxVH/H4nNS4/YwoRuAjq+z6rM/SOgTMuMwr
         ktpfqciA0gIYVV42ABMkiogLcib9l7CRVc4+PgX0V+oZMTF8GmYrZemKxTfj09WkdZHf
         yi6Q+qQpJO4zBDDPzKSCCCtWH505nny+/cRQWtOZmjPuwAtmi4VQUm7htawhSPyVcvNd
         T7dw==
X-Forwarded-Encrypted: i=1; AFNElJ/Dz5SN0k/zZGwXg+Yc6K+km+y1b4SvFYWfTw2gu4mdzqUvhKK5H4mnkXei54CwXwz/5Vv3opUOeYDr4Qyd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7nNzY8AINHL252MfszIpT0AXuLmtuTVMEnYkt3xyxyV/smUiB
	LmROwCU2ja6Iisc7Q9E5Tkcvbv/9SKkC55gZgJyDqr+oMuZtj5aVwYCkaz6Xlz9IFcGE3Lr885k
	80Fx3xVE6Ds6HhlZQQfHIYhWyM7Dwp0JoD00Y0WB3oIoTIqSpYfjMKTNkfCMiz5gWLBmf
X-Gm-Gg: Acq92OFue3npuDEuwLaFNFGeKstrH2fJj09+FS5HpXqpVSZu9/ZZbdO2gpjzrS79QWv
	63mDTqNJfLVdZ8CU9CEOszQHDvyVDA17NW6dE7tpzTYv+brw7YfDfn8gaGS/U/kccI01sCOReJN
	48Zf2pZ8ZOLF+0MEHP9i6fTq83j6pThlmx+/IccIF24MClO50dULvU8/1qgma0kmGv+2w8H2npR
	fn3KC5weJcLUumujSV+MyZPLF/bNTW7zUv/HbaR31GRYNoKxYUCr86hscups4G+1vs3SO42xG0q
	iSe9ek/6HLKRG58/xyecTk01GZzyXRJWdGUODtBQuFRtp6hMurWxRwvO6APtgM+5K7Vbb7cB2/d
	1ilhe5kpNO+Y3aE8Nc23nFzV5unBah15JDkKyN+vX5XFUIPhEnkHjLDcSCgzhOKG6ryn0om08/o
	6f03i8+XdYs8MKe//J
X-Received: by 2002:a05:6820:1606:b0:69b:b52c:c9b7 with SMTP id 006d021491bc7-69c9c01d0a7mr13771696eaf.41.1779274912616;
        Wed, 20 May 2026 04:01:52 -0700 (PDT)
X-Received: by 2002:a05:6820:1606:b0:69b:b52c:c9b7 with SMTP id 006d021491bc7-69c9c01d0a7mr13771646eaf.41.1779274912186;
        Wed, 20 May 2026 04:01:52 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d48:e1ec:d837:6344])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eb6320sm840310266b.59.2026.05.20.04.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:01:51 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:01:42 +0200
Subject: [PATCH 1/3] power: sequencing: pcie-m2: Add QCA2066 (QCNFA765) BT
 serdev ID
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-monza-wireless-v1-1-9f6942310653@oss.qualcomm.com>
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
In-Reply-To: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: wwk-ocpxYXNXqk5bXeAjy8wHvRiA1_Pv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEwNiBTYWx0ZWRfX4J3dHXVfbk/A
 PWUX0Svftw/llZbcb8kk1x36pw/vpVfYJlhQhfxUL7l9emcnnd7QxwK7HlZMKdlyR0xiJZVPDi8
 ABJ+OrGTAEzppkqisTnvRCZAjbRKPpRem4u+woH+XutpnN/zwqOxbUbbJlj1GpT55C+Ve/jZ0+i
 L9KO7W+kiFRvb/CZC+EoChrdY45HRD9i5mu4hyJIG1zzNUAujEeLTLb6zhCy2CfgXD1Rk6ZnrpO
 87rYjLEd2uHs3/hKd7Bp1le9CthzvLz/bOFAiD+Ul6XDTyiFnPg0RssZvxAD31nSZ15NFM2qS1B
 bHDHNufgb/I07En8SiICgkbMv/tUgXxKUw1ipwAyZ9DAUaoMz3a00nzVcSqy+a/lcLL4CkJi92C
 iLVueznkWaM+1Em+ZmueBTJFxGmP8x53XGhew2l0ljOb5XJgN7h0q9Eu9NspWKkKa19LKcoIPHG
 SDnVcZZsX1St0N/NUZQ==
X-Authority-Analysis: v=2.4 cv=TO11jVla c=1 sm=1 tr=0 ts=6a0d94a1 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=nYxCwpw-O1B6azs0dq8A:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: wwk-ocpxYXNXqk5bXeAjy8wHvRiA1_Pv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200106
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108711-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9E8A58C0F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add PCI device ID 17cb:1103 (Qualcomm QCA2066/QCNFA765) to the M.2
serdev ID table, mapping it to the qcom,qca2066-bt compatible string.

This allows the pwrseq-pcie-m2 driver to automatically create the
Bluetooth serdev device when a QCA2066-based M.2 card is enumerated.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index efeb25ba9c79e20fc8bc8354def8ae423d0f2f2e..f90df88c663985c7702c19911f0c147e3b68984b 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -188,6 +188,8 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 static const struct pci_device_id pwrseq_m2_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),
 	  .driver_data = (kernel_ulong_t)"qcom,wcn7850-bt" },
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1103),
+	  .driver_data = (kernel_ulong_t)"qcom,qca2066-bt" },
 	{ } /* Sentinel */
 };
 

-- 
2.34.1


