Return-Path: <linux-arm-msm+bounces-117860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +kqxK0NCT2ojdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:40:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 073F372D41F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 08:40:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bmslssIa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YY+NvwZ3;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117860-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117860-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDBFF30131FC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 06:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654F43D34B6;
	Thu,  9 Jul 2026 06:35:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018733C10A9
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 06:35:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578935; cv=none; b=M1qo7khgngf9xzTx6KzX0xbZoa1qGGqCGnAWnyNjMvR/UfsE+tEEnICGuJmsLMo+lTUsj8gPvZguotcat9+zij5qTGVPnPHoomrdIzV5+k/4V+FPOIz4if/BWx6z8/DOYV8klfE2KCshWQLJd8bdTDqPfDLvKfYXs93BxQjY/JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578935; c=relaxed/simple;
	bh=sF+5+mlvT40t4Oa7kCgpbppxkmIb7GFh+GBtlhUHWg0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bsNI7UL53ib1iM4h/pUrojlgopXVlQdRPjzZT5ZIeZrzfQlizkN604mx3OPfrkE+W+G9mEd/KsBYF6/nOJbvVG4Q8KkNMLZCgn2kAJa/YFuWxRiBF6pJDjTev6PZ9YOIHjgYvha7OMpiiLQU62a3WoAGqHJI141g4jGeV0F+lJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmslssIa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YY+NvwZ3; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6695xxTg710968
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 06:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VWOut9Y+gjUFIHIxTYgSGy
	NQ1g4rRooiLUtEV7k3qB4=; b=bmslssIawUWwwQYrjm4vV5J6Jbd++0vXyO4tuX
	K1NsLSUDti/yC4Xr3wSVUwD4c8KLevWZPkYsW03qsoH01zAMIBkixNJMR/CGg6Ap
	TNNk1tG+dx8+6ABSyYhcx66+EzQbCo1ExqrUSmR8gRQuxLvAsZU3cR/F7uhLmAHC
	oal5KLU0xUoaVJPM7qDfe9zWeLEmxEDYZzGr2eR3oyOxdI5YZQfkjJlpnKcS0chW
	O3a1zostOgz6zUth5+QwMkxacYVA+68YWiissBGEJxmNeL08nU2G6KxbH5UkS8KJ
	Gcg1Fv4tAshS2TScvOQ8tCd3HnJIb6S1wx3ATK4jXTL+o1Pg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vgarr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:35:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so670694a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 23:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578932; x=1784183732; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VWOut9Y+gjUFIHIxTYgSGyNQ1g4rRooiLUtEV7k3qB4=;
        b=YY+NvwZ3lLCkfOyHIsIKGev4m981G2jwA6w41MCWhGzs2TZY+sawY+PKLLLSNi1F7d
         0cMovQAsGvbP38xAS7H55qo/+ckBEsPclSOPI/7e4jfMyQn3kTlM/pwDjKHopO7IS/nk
         0cgA4LI1BCAYRrLMn2xQRejIUCaE4KF+d9CoEljpDXz5I91NgGsBu5YgDmBgBT8EhBrP
         gp12u6Kr6yYsChjcuSYhb5AYTsSVm9xImGlvGcCW/RqNfPjmN+7Rhf+kNwHJdfPilmBd
         6fxOKqzRJwasrNDyykrt77Xqj+4tHN8Ia/AU8FO/+9L2dHerKv0wbN4DI2dS04+mTjxf
         epZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578932; x=1784183732;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VWOut9Y+gjUFIHIxTYgSGyNQ1g4rRooiLUtEV7k3qB4=;
        b=Of0Bj7aOm3oWt8RXR8sa4key39Sb6mzAptiToxkqreBcn4QMLy1v3FEtHyLm+gssxs
         4TYFAhWCXKvDsU6XjFsX3pMKCgLSMXKBXOBztYNEOJhOWW2Ab9Q5CxMD1wxcOjRrQv5h
         V9cM773DVEzKkKzsBqvMh67Xyps+htAgxCYmmx/Jef1TfuTZ//Va3JjLDtuza1Zm6lZp
         Uw1UKhvB0TcExQdJFco9PXlbemHzQlIXu1n/Ps1li1bVEZ/6ENPk9jhr5ixFIjbkKa2T
         AGdeTKZ23ehMVr8MuDwauVJuyqha9gRHyybJgltKNiWCqJshS1cnAfxIN/DKoG5RRZk9
         atcA==
X-Gm-Message-State: AOJu0Yy5YCdUrJI7IOO8xLAJ5iveZevcQV3/TSthxM7Nf/KvTphwYgm5
	sRDc05e/s3nV4WGV7W9k06deYWQgzvP3teRQXuQNaMDcZYcRyF75qDti+zNN5OaY9AhRUpnfX7N
	NB9Ea/DulL9r+O2NV0nQdk6QG39rTjcLnu/8ynCVYNM+hTi+wFexCSp0x0esN0/yGY1Vl
X-Gm-Gg: AfdE7clSoesfopBuGinYvN/PY2bNYYAnOVBPSXmUX6/I/dazZ0TdO0Aeij+DzrpgL9D
	scWvvSrWr+SG4lE7JzVIJQzmnYjs1fTaVWkFOTqc/V23k38ABjfNMxKSVgSwpigld64OS1h6irY
	n4bkdoQQtgdVmPtyEdwzThQwe1NWLYBuN6UEXP0yf9oGyhj/5xzkJr3I35MPF87DlE4L6nDYoQu
	Q4oiA8N5BFEX9ziEFL/ZT4fLFFwdtHOKfRsbvyenU8SqxR9kY4bbrkvm0h8wG/HI5yJvyrSz33O
	bRwKzhLiPHx55eEK2UNegjAJO7kJRtjq1Rb601r3+uup0rPfccShrukXxf6DDlNzEblCwAmOFO0
	Q7CbIQ3soPX2gWmk/oqLpA2lfT+oPpZ3yxrRJspyyOp4lfQ==
X-Received: by 2002:a05:6a20:a10a:b0:3a0:c246:bb98 with SMTP id adf61e73a8af0-3c0d6b91578mr2421112637.29.1783578932500;
        Wed, 08 Jul 2026 23:35:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:a10a:b0:3a0:c246:bb98 with SMTP id adf61e73a8af0-3c0d6b91578mr2421065637.29.1783578931952;
        Wed, 08 Jul 2026 23:35:31 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm28304294eec.16.2026.07.08.23.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:35:31 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 0/4] PCI: qcom: Add link retention support
Date: Thu, 09 Jul 2026 12:05:15 +0530
Message-Id: <20260709-link_retain-v3-0-81a9d187bb61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACNBT2oC/23OSwqDMBCA4atI1o1MYjSxq96jlOJjrKGatIkNL
 eLdG90UoZuBf2A+ZiYenUZPjslMHAbttTUxskNCmr4yN6S6jU048JwBMDpoc786nCptaMcUy0C
 WQqIg8eLhsNPvTTtfYvfaT9Z9Njywdbs6BTAod05gFKjEQirOM+hEfbLep89XNTR2HNM4yMoF/
 iNyvn8l8EiAwlYIVYNizR9iWZYvOcJmwPAAAAA=
X-Change-ID: 20251001-link_retain-f181307947e4
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578926; l=3032;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=sF+5+mlvT40t4Oa7kCgpbppxkmIb7GFh+GBtlhUHWg0=;
 b=4WF8KeneP5kDFrwQawQN2JEQpi2M5tVjiuO/q/KkGovSi6O5wQNu7o/BGrMJ7isY9467o2KyL
 GQouKH0G4YnBmpJvPbT8rxsoCS3EE3Prt7deLSEjjmwPAIHqfDXmQm0
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2MCBTYWx0ZWRfX0PglpIHgouUw
 IuUEn5Eb8fnCvosji3xoZV+8xfpoj0RLmRfekzfP0tr9uYjXzPLEidWDeQpkUx8+xJOsRA6ojGe
 ESbYfRQg0v54spKd6pHQvVMLCkJzHWpbwi0tiK0z5MT8Q5vGTsgJ4uhqNJ/eRJfku5nSmb4jgrz
 OofP1baptG1IlZlZVW59+buHn7E+YW2MXvlxFDknn8+sCE/VPTluS+gvF5nZudxtYbNl1o/iqSn
 qmEou/RQZS3ctm/9ufjHKCI5hZvD99W/Baoar7Lw36f2U6At281Htqn3Xwf+XWXrqfTBexKsh8B
 GSw26mYEoQWrVXsucQQ77SWZFIXaGSYZ1Cx50mV5iIduPricPlOI32nD/8atzvWzJHT4ljheW2m
 M+gzv3PnnX8VOFvvoKgPzpVjgz74jY24xPsYhEeEsHvd3jZES3g+kwDpX+JsU5B1HdzXAbrnQQH
 40vZQ2SRHZT9vzTURLA==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f4135 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=fuwIWhs0SkhWFt5P5XoA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2MCBTYWx0ZWRfX6c3/doKMuC+3
 nYEp+6d9/dyEr1o36yX62cEOgyhkqL4hJKknMRA9T48N465hv9HnakHvLw03evbq4Wrxu9rs+tu
 y+aGOXTq4DVAKnTHSOF6uf4eSjyql0U=
X-Proofpoint-ORIG-GUID: 4pzT5CZFF5Gz6GkI30SDYhnwDcOUWjUf
X-Proofpoint-GUID: 4pzT5CZFF5Gz6GkI30SDYhnwDcOUWjUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117860-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:p.zabel@pengutronix.de,m:jingoohan1@gmail.com,m:mani@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:qiang.yu@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,pengutronix.de,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 073F372D41F

This patch series introduces support for retaining the PCIe link across
bootloader and kernel handoff on Qualcomm platforms, specifically
X1E80100. The goal is to reduce boot time and avoid unnecessary link
reinitialization  when the link is already up.

We are not enabling link retantion support for all the targets, as there
is no guarantee that the bootloader on all targets has initialized the
PCIe link in max supported speed. So we are enabling for hamoa & glymur
target only for now based on the config flag.

If the link is up and has link_retain is set to true in the
ithe driver config data then enable retain logic in the controller.

In phy as we already have skip init logic, the phy patch uses same
assumption that if there is phy no csr and bootloader has done the init
then driver can skip resetting the phy when phy status indicates it is
up.

Problem:-
1) As part of late init calls of clock the framework is disabling all the
unvoted resources by that time and also there is no sync state to keep
them enabled till the probe is completed. Due to dependencies with
regulators and phy, qcom pcie probe is happening after late init which is
causing the resources(clocks) to be off which causes the link to go down.
To avoid this we need to use this kernel command line argument
(clk_ignore_unused) to skip disabling clocks as part of late init for
initial version. Once it is resolved we can avoid those kernel command
line argument.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v3:
- Updated the max link speed and current link speed logic for link
  retain.
- Fixed l1ss_support & probe deffer fix as pointed by sashiko.
- Link to v2: https://patch.msgid.link/20260521-link_retain-v2-0-08ed448b081c@oss.qualcomm.com

Changes in v2:
- Rebased with latest changes
- GENPD/power domains are not longer getting turned off with the latest
  kernel, only issue is with the clocks.
- Removed the patch [2/5] PCI: dwc: Add support for retaining link during host init
  as we are not seeing much difference with this or without this (Bjorn).
- couple of nits in commit & prints (Mani).
- Remove skip_reset for the long term (Dmitry).
- Link to v1: https://lore.kernel.org/r/20260109-link_retain-v1-0-7e6782230f4b@oss.qualcomm.com

---
Krishna Chaitanya Chundru (4):
      phy: qcom: qmp-pcie: Skip PHY reset if already up
      PCI: qcom: Keep PERST# GPIO state as-is during probe
      PCI: qcom: Add link retention support
      PCI: qcom: enable Link retain logic for Hamoa

 drivers/pci/controller/dwc/pcie-designware.h |  1 +
 drivers/pci/controller/dwc/pcie-qcom.c       | 80 +++++++++++++++++++++++++---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c     | 31 +++++++----
 3 files changed, 96 insertions(+), 16 deletions(-)
---
base-commit: ce1f20ceb245f81cc147bf4fd570c09f9f720ab2
change-id: 20251001-link_retain-f181307947e4

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


