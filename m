Return-Path: <linux-arm-msm+bounces-116230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YDgwMed3R2rZYgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:50:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C059700471
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:50:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lenN6ra5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LkcXeAKY;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116230-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116230-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6ECC311D556
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6B13403E7;
	Fri,  3 Jul 2026 08:30:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C85532572F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:30:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067444; cv=none; b=UX4WQzZd3saxmb5uo8C4s8LQIwtXZWeGa1o/lKx4+i7OHQFtTDViHNdcDRdl1KaKKKV9CwGzIv6SLTmG/bMlu9S7EDNilAyeM3YqjS2ZrssfbWLp0+VT7akg7NRdm5DYxKWEaakMfZ0Siei7rDBdH8C04Xy2SStDUfDwkpQ6j9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067444; c=relaxed/simple;
	bh=vkOBJFJbc8ahCMf0KYx0lIWWOVbcyMJFfwTRFEwuDcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tJ0jisTu0TWA+X1LlhXUFRt83A8cPUR+7kQjnDWoggZ8cqCNU3FqnCjF3qdLIDOHrMiEyqOFDXCzEKo4Y6y1/3KCEjkJ3GuW4q+kWpLSEvCuB/DthNdfjez1jzzT7iufVaWWGBg/rEYZKNj8mviKBfoG5QYab5INmfjoTViSOxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lenN6ra5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkcXeAKY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637ZpxZ3410199
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 08:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQzB05Le3t7BkZlqCUIOe2NWZsKrvDirZj8lWTmzDFI=; b=lenN6ra5NjvNgmWd
	P6u+RcmhBs2ddlHLmfmYGfkWuFx2K57HCwIgl6OT431lEGa5CMdBvL/dtaxmAlJq
	RuZaPyrKr3mY+BHHpgRJOahcD8J6bpOkIR0cwIrZ4ffAfeM4wkD3oi404zsGQASv
	nMNwVg5tOkaafYVTlefy2A942gwIzV02kpreHnvta5+Zvb5KjacTUk4Zc6Km2fl9
	5LhgKMbUI+hdZ59dKbvIN7aSKHzAXJlXLj8gFjH90ao//wKlgS/b6Urcv0iXDOIz
	UCBAFeCrRzXNvU2WezJLVe1VL124MAFfPvLCspMSJFSCh4pcNo81zPbyvzFjScJ6
	sRvr+A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68u306ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:30:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e38fbc5so25933185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783067435; x=1783672235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQzB05Le3t7BkZlqCUIOe2NWZsKrvDirZj8lWTmzDFI=;
        b=LkcXeAKY6Is8pm6hXVRsebxCHRKgaw/AKcv+TaaUT0Evf4Fj1RLNUfZ+hy8j8CZBKq
         3ZzXZVRcI7nb+chICAc9S9C7r/i8aY/8J+wU+KvVf+3QmtK6G9DfJ5vEbOHE0qaV4lb5
         PH3rttLaU0xhZSOSdPJnm0e8HWPj8zBsT6w1Np+6qja+Fmt95yRg/glhZlgp8/qE9oBC
         xwY93/HghRS5iErzMK6aXNFb6T2bq+ZexfzaGzG3qA49N1xJBjNmpnGr8pg9TjYNTBvb
         DLU/a2LfeUTKMyDgZaLMmKH3At9CfhweDA3ndUlA5yQjHhnLlaG3KyoTA2+PTI5pvRH5
         fk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067435; x=1783672235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IQzB05Le3t7BkZlqCUIOe2NWZsKrvDirZj8lWTmzDFI=;
        b=Okag7ipd1BON0VeC4tVVgn81VN+uDcrw0biHwTFoein2xUE1bL/ieyLhB+lgOj8Jm9
         zGRQj0t3mA35MXwQZElgSSrBZwfKVot/5TB6ydoHopr7gUiZ/mInK3Erfp2W/gng/X3k
         Stg3G8lIx0UgiPUEa2XjB3ccCFs2x/uEUSV8HQ5WnrGunDBXBuJbU6TeBqYBkrzE7Zmk
         XNoHWdFYoMEpvdgJt5i3rw23+aGDZVo7jTOxyIwdFYtmCuJwmpOCcSIP7IzV2RzOE6SM
         qdTxlyP+Ex1ybyfOf1YdtDZaobMWoqDit3DnjvDqZbtEunL3B6p/GYeZ1oHz1whTLFP2
         FROQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WRWK5xTAMIJozALOPMikPqGqNPRFRFNGC78wG58ZfaJc31vO40dLxUjGmoTsVAm99u3OdvFNUKWvFRkjv@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4JPmEvr+rcR8DPMCcyWp6zx2pBeU4Vof+IqKXLN6BkoqcJoTc
	hyGm4WxpC+Lp66Qy5mvTytmGs2N2FZ7fR8mhgd/btOUJwp9HbvvArsMUup6dD5EuBzvbo7Umd1r
	Vu8JcOClLVwgFju0W55S8RoQjtvmHgtYJlDpohResdZmND2J1kmALKhcfwBMwDXI+3QjB
X-Gm-Gg: AfdE7cnX7kgH0i1W26tXaf2KWeYkARLC2w5MANPygMEGFkG/CP2paOm2EUbtZNJTG+R
	4GLIbd5trQHKxdvQSagEVLYJ7JeacgeaKYksa9+EN4E9NGYICzl6JEyiT8ScqqqCAXExGkn7IAX
	AF/+gSG5q6iqMbxnsJDq2lPElw8ChxT5urPA6/X41KIGKF4EEI/kkfeLPbI/MT2Mt3nZmIdvAcl
	RiTidwPjO1JQLaFo78V9hLFYMUD3WTPEw/o/15lSbAinWOUAKrsndimIU0zKx2lf16809QVqGHA
	JSO5vXy3/f5vU7kQUA9sT4AiJ7MzkuvnBZQVQ+qEvS7XlVFxfgI56g6IOp69X6pz782Sbh/BdWQ
	ib9q0JJwpiZZh7VNq7Yn2tgRFanGHFE427pEuc4I=
X-Received: by 2002:a05:620a:4711:b0:92a:dcf5:ba5b with SMTP id af79cd13be357-92e781d35e8mr1242533985a.14.1783067435220;
        Fri, 03 Jul 2026 01:30:35 -0700 (PDT)
X-Received: by 2002:a05:620a:4711:b0:92a:dcf5:ba5b with SMTP id af79cd13be357-92e781d35e8mr1242528385a.14.1783067434660;
        Fri, 03 Jul 2026 01:30:34 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b934:1281:e054:26d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dcf59sm16287808f8f.34.2026.07.03.01.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:30:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 2/4] power: sequencing: pcie-m2: Add QCA2066 (QCNFA765) BT serdev ID
Date: Fri,  3 Jul 2026 10:30:24 +0200
Message-ID: <178306742016.7902.6406831777462016236.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702-monza-wireless-v2-2-7b56e2a6a6d4@oss.qualcomm.com>
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com> <20260702-monza-wireless-v2-2-7b56e2a6a6d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eJHu_IGKS92YhKz1O4mOh3aOVwTQhGsU
X-Proofpoint-ORIG-GUID: eJHu_IGKS92YhKz1O4mOh3aOVwTQhGsU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4MCBTYWx0ZWRfX8kOgeQN0vui6
 c44j1ehiueoNntr6XDeaJCCEi4Hz9abjRNCQDfXAKBG+SmRyzQBdIPitLplJ8Gro9BL9gRsnxVz
 s3d4Bjwp4CqwzaE6oQ6hUYVyyOuQO7Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4MCBTYWx0ZWRfX0664Uuxdmh5x
 JAZ0C5yJs4v0IkS7LA6EpNnkap8Q/aicFkbc+ZHB9XJwKGQBcOCoADiA4oXzM9zmIzFji4v3Jx8
 yQOMdK5lCxqCBIMkpaHmNQ+uKn4TeQ4ZynPok5VwGDFXTkwoU4PS1GetfQUhsvEWOL8m0KyjtPI
 6qBlJkA658uEB5S9LrPLsKEXc1PSOkHTXX9UFGRh32HsSkzI96+T4+XNq7GHxqkt3m3BOfXBM/d
 k+3bJDs/QlHgtQnFjgDOHg5X1Jf86hQRdQVLS7hV5/60DQ4Jnbd9kIzXowOBqC2gr2WBIHeh6+i
 SDpXcTfMX/PgHpvInlUV1xKtT1CFwJfqXI9EDkej4Ueaf6cwuu8zLnB5/FtcW6e3/jJLfY8hMQI
 vKXpaOEI801/HOeEJtAfNbJGBxJfEEM2uK0dLwiKH5twNNNACKmX1PmBSTuclBo8KJAVzS3/NvN
 qrC1/a8CAKITp0e4mng==
X-Authority-Analysis: v=2.4 cv=OaKoyBTY c=1 sm=1 tr=0 ts=6a47732c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aaTFUzO4qDWa5CizT70A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116230-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C059700471


On Thu, 02 Jul 2026 12:46:14 +0200, Loic Poulain wrote:
> Add PCI IDs for Qualcomm QCA2066/QCNFA765 to the M.2 serdev ID table,
> mapping it to the qcom,qca2066-bt compatible string.
> 
> The Subsystem Vendor ID (SVID) 0x0108 distinguishes the QCA2066 from
> the WCN6855.
> 
> This allows the pwrseq-pcie-m2 driver to automatically create the
> Bluetooth serdev device when a QCA2066-based M.2 card is enumerated.
> 
> [...]

Applied, thanks!

[2/4] power: sequencing: pcie-m2: Add QCA2066 (QCNFA765) BT serdev ID
      https://git.kernel.org/brgl/c/1656f4f2eb45d9f18515ac00657a2494719fa065

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

