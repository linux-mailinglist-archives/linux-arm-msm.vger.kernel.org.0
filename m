Return-Path: <linux-arm-msm+bounces-117221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FjoTA8jETGq4pQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:20:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC911719A8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:20:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k2CayWgQ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Bmd5EJss;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117221-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117221-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB1723036B8A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5541E38F251;
	Tue,  7 Jul 2026 09:14:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B613B3914FF
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:14:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415667; cv=pass; b=HZyPtXhfImn9WOthRoC1zREfiw8f24s2BltRkMM7z7Hd9IHe3Zah0boAK3Jfl/JYrgnWOsBYghq+5PKuhkBJIPurbaxJaL1XvCsYKqpTar8O5c9Aa0x+TUndwVmtrec6HoPenlzVRcQYCXZ5zKPMonvO0vgf9onpZJLWklnww8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415667; c=relaxed/simple;
	bh=tId6bX+sfVblETA9h7jW1T52GCPIi9+Oqbw/3POIA/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XXgh8/GiXSRunzSUt5ZnEj5iYn5DY52NVtUycStzxcsEGtWXt359jTXtSQo8ytnGJTyRBKHLFuTTXozmtZ7jZ+lrj713VqDOv2sCgMXAFC1v9IbSXQhf75pkGPcn9pu8Ww8KU34yjlrGd7k9KUHuDrw+Ci1xD8zDKONtl36yDaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2CayWgQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bmd5EJss; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678EE2K3203466
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pu/T3O5IFYIVcL/NKBgCksHrYTwl+ICEoKPHOSRHwDI=; b=k2CayWgQ9+eFsDZN
	dLJAaNE/s5IHgx3dicq5hpFCeEUpvXrRFa43+MSueA137TE5WdAt9yIPM1hHIv6W
	PYx/ScLFu4fQ4GAy5NV/NSeQ5ybHlBrMjxtd5OAlJRAy6svBwmZpjqaZKialOVOC
	OFDLQnj+0mIJKYU40Cp/j73wr6BmMzERSCC4k3kw+LJZoYpukHaoNXFcp73lVMHN
	jDByRKHPfOnsUpUh3t9nTBir8FYZinQ12/71lYvN2Qp7PICF1Y1TOzpadp+X7cdq
	vJET/n5FqtrqWGccj4jNDvCWv6YXJGJZ7jXk5yI8kq5iLsPAedV8MmoTQYDOpD1a
	1Y/IEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9a8nyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:14:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6a2f5995so644970485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783415664; cv=none;
        d=google.com; s=arc-20260327;
        b=Gl8RjXJ6F34iGmJehXSuUH8caHZML9RPU2XdibyhgoMYDiDUDRYELF8kxeGOBm3eBq
         wGPLkOypfbN9B4plGPklI4MtdFY83IU1zSK+OE7WvD8pkBqQW2qTvDmVqrhkULDkn+Rl
         l6d6mA8WvFAUElpTxI29v8BxAgv1ju8J42YgZ3+CFDwxT7chk6t+Zu9yaF+mNTCM7DBs
         HNaq7ZIWMKfjyNDTo3RD02UrYR+WaGKe4jaRrSVg0s8Oh3WAEc6L7SJk0uuYNzEDDXrU
         a0LnneCT6rjNN3M7iT0+6zHXs4IUGMK7xsuD8O5MVfKbI/Dw/RYNdkDoMFtjgws2G2H7
         PAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pu/T3O5IFYIVcL/NKBgCksHrYTwl+ICEoKPHOSRHwDI=;
        fh=Guvce3Zf66zdByUr73t6R7CrawEVYBvF8P+3f1NJysQ=;
        b=KkVcNMJyhOBhX90eK3U1MqNvmI0nswqzCqCHFHS83vWS4JVbM5s7H66NBGCDH1jeLq
         vsoSp5hUbOyw5hEjx9XQ53/XI5y+ooOW4KnYDE03g3+fLynX8RtsSPPY2iNVrfCbiKWh
         I+DEDov7a82F3NBfdfhjp3iI9vNFGlym8Uxo0ef7jpjuFJ00myQ3Egv7Pm4E8jSHRX69
         B0XyKFtrUrxWX3fOUSxsJHsqkADTHOPydVMPFo0tXBpt6guQghobwCjup6SXPoe5QjO3
         Pvk27G7dp0IABgQNNJ/jY/WpxBNrmL4WmqN6y17m8OnRAN88ILbr/0hJV7lKNJB5JcfS
         VgnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415664; x=1784020464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pu/T3O5IFYIVcL/NKBgCksHrYTwl+ICEoKPHOSRHwDI=;
        b=Bmd5EJssyi4xhM5qEw3KMz+pE9YUrezI7jQSXYR/6+j4ttNCpiGus6+yAGcivEKo4D
         qU4GqdDuN4kOvPeRjeXgtforIW6ur7jTVK1RXnx8hagzcSxH9HREnKBXCulv5r6plwVP
         bXj4cxMSW60mdbUHpD1z8MP0M7v22m1w1Izw0hW1FZrksc5hQSwpuV8/zb9613FXIQ7x
         fvF5Sv8dz8hsS/XU992hYoCntyB3yhqn2htlpTFDzCskoANx4hieaB3p2kE07qXbAgJD
         ovJk1fLyenWLUZlT3ncKcJXAcO06yUwJ+Nkyc1FoADP9HTC41bNB2oKpo/z/dRloVp9J
         xkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415664; x=1784020464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pu/T3O5IFYIVcL/NKBgCksHrYTwl+ICEoKPHOSRHwDI=;
        b=Y3/05he8OtVybBXElIZ+gqTbCcpAsvf6HTbaeEVS8yjtV8lvO3ajNyRURE5lgkTVrC
         7hFcSJAA6/bLc/M8k5gz/Dd6khuHjwF9gS3Ti3SgDWVhXdwyE0eOB9KmGpUfr+o5wFgx
         P9390/+yIGizzXm9N5Fk/iGdZd86P7cCTCAbdX/sTxtGyPau4UbiXcHwvx6+u2M3QNq+
         DTtZ3C+StfgBUFCcHyhOlnxhvmDwn1GoK8UIKP+7fv4VD+L1Ud0dwShO2PmZLeZc6jZh
         qItHOu5dP9+fb4iV6Eo2GkuAgOFwdFzxZwI9fuJ5BPxW2XnFeC+cWOH64wnndTa4dNFr
         OCQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGkQt0Fv2yc0EDHCVD6yPuKM8DyinrJOKba+Jf8FCwsjMWnnsSoS8KJauPBNM+YuyXmRYjwEDKXovts/8P@vger.kernel.org
X-Gm-Message-State: AOJu0YyCi1f5+bmwS2quGRtAAJc5ATqoLQ/gBxsGHzrjQ1ZetdS3xqVj
	s5O0VdjoXR7b3wlAKkax0SBQZwfejVAcwimJ7AuEEyUVNRBba3OVcLQedoHb8ndcwvt7YCEFUa3
	ABoFvJUcAnyjP53qYy+zq9P8lQi/HwcyyO89fo/GbzrqfJrF3YaR/BVYzHz8QqCiiozjDs1EsFL
	iDL0e6H7zn6daQd82KAiaYzyiaAAAXsSeBk4UNt707pEM=
X-Gm-Gg: AfdE7ckGl+hpNkJgK1pI7M1qPTkuDfF5GKJ0fhCno9pm7ugm+Zp9viTjgNZUsCBTTaR
	2F1RklufLbZLGnrDOd3wIXuAE9AlQUakTWDzDuQ19GkA3ObGlBS5uPcpiqhCVlvWaIdEri6Orip
	+gQihp1vS/XlQmT5o3mB44D75H4OkaQQEfx4JTw7HqdgillAJDzTRyqiBvFbWUr123l9TzFKtNO
	GfvqMlNqUP/IL8wZHzRySiLgQnC6hT7GkfIuAaodyWiWSC6McE94OoCUQlQs8GIlky7l9L9RvRU
	fg+n56guwgk=
X-Received: by 2002:a05:620a:17ab:b0:92b:8c84:3e61 with SMTP id af79cd13be357-92ebb4b43aamr520592285a.3.1783415663662;
        Tue, 07 Jul 2026 02:14:23 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:92b:8c84:3e61 with SMTP id
 af79cd13be357-92ebb4b43aamr520574385a.3.1783415661343; Tue, 07 Jul 2026
 02:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
 <20260702-monza-wireless-v2-3-7b56e2a6a6d4@oss.qualcomm.com>
 <43re752djujsh2kiyvjlkpmztxsh4atg6472qhir4lgay24zbo@mtlkn2xc2ors>
 <rxt4n6vuscu33mrw24af72lb3s6urqfpkhtia44yfo4j7wtu6o@3xp57owekrgj>
 <u5ieok3hgjcf74sxjdzv6xurmlbve46xa3imgfnom4hpjarmxa@fna5daqpyk3r>
 <zat6uuvh7jwfxajvqtif6d67osf6h5b2vxig3bmuch76btpdkj@bfxjj7kk5fjk>
 <ynhos7h4x3kbqbio2gkigoo5rqbwogrzihkylxv5pqjtqpqmnq@rlyjaiopx74a> <l4qycbmz2zaroe5rreuop4dx7ugfcx37hfaketvn43trdpaept@jyx65agqznq4>
In-Reply-To: <l4qycbmz2zaroe5rreuop4dx7ugfcx37hfaketvn43trdpaept@jyx65agqznq4>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:14:10 +0200
X-Gm-Features: AVVi8CduE2Nonq5P1YApvPwl-pxo6P4sEIM2US1PAw61u8B5ymQBuhJPdhfD7bE
Message-ID: <CAFEp6-0AA-hTy=3KaRNEJ+kF0otGLTGTujvWJqhT2dHDj94E4w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 7M-NcgBoXdKHOY7fsERfDXxH92CpMrxd
X-Proofpoint-ORIG-GUID: 7M-NcgBoXdKHOY7fsERfDXxH92CpMrxd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OSBTYWx0ZWRfXzl5StCVg34St
 PqRLow2tXjyO1H3n+Zk+Na9O4a2oErLk4ZBM0ODz/WOozGNbDF3aeD7IGYrmJxgST3R/jiJIERP
 5xtxOtIA0VQf6wRpMb/WLhDILLrDsko=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4cc370 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CFFC92ghu-o7u9NOV88A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OSBTYWx0ZWRfX+GteEQNtl9dq
 rSuTvvOmrg2o7Ijt2aD4X/uMuU1X38xj43kyirK/t18yl4IAXydbdxcoIn/8SMKSnb/Hr3kuTXe
 An+1rJv1PwJPBoBnDm+pRDsCwl9UnmuUiwWF4hFNfKaSVvfK4SufiGG0kfPG0om9O6zh9OiOnr8
 K65Zdew9wvkx9HGuhjq7A0zuxGAA3d/Nc4c9jYs20vJ7JiWlsJD8kqhSR0YTuVJq+lVNn683Y5F
 xhl6BPvTgsa/qby94psOEJnDpLnGwzJOQjBzGclAmm1Q6HnfJGnS84vtOWaUrr9/VtZH/1OFMQY
 JWgy40C3JTUPVJCfrQnGcHIip4Be5ffn0jZAzwvPEWPPvTY38TDHliOFCG2ZJURyENrfBnlbZ0V
 avWf167uuIpnUgg+Lsqn0LCeujQQvaH5d+TopGsnEUyA4qlTpR9kPZLEHsVkRD+TE51bKFD4/jc
 WBQTemmpZuYFTa9YX6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070089
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117221-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:manivannan.sadhasivam@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,holtmann.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC911719A8D

On Mon, Jul 6, 2026 at 8:44=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Sat, Jul 04, 2026 at 03:11:13AM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jul 02, 2026 at 05:08:56PM +0200, Manivannan Sadhasivam wrote:
> > > On Thu, Jul 02, 2026 at 05:34:31PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Jul 02, 2026 at 04:17:43PM +0200, Manivannan Sadhasivam wro=
te:
> > > > > On Thu, Jul 02, 2026 at 03:14:49PM +0300, Dmitry Baryshkov wrote:
> > > > > > On Thu, Jul 02, 2026 at 12:46:15PM +0200, Loic Poulain wrote:
> > > > > > > For QCA2066 (and other QCA chips) on M.2 connectors, the UART=
 enable
> > > > > > > is controlled by the W_DISABLE2# signal managed by the pcie-m=
2 power
> > > > > > > sequencer rather than a dedicated BT enable GPIO.
> > > > > > >
> > > > > > > When the serdev controller has an OF graph (indicating it is =
connected
> > > > > > > to an M.2 connector), acquire the 'uart' pwrseq target from t=
he
> > > > > > > connector's power sequencer and use it to control BT power in=
stead of
> > > > > > > the bt-enable GPIO.
> > > > > > >
> > > > > > > Also allocate bt_power unconditionally for all SOC types sinc=
e the
> > > > > >
> > > > > > Can we just fold it into the main struct?
> > > > > >
> > > > > > > pwrseq path is independent of the SOC type switch.
> > > > > > >
> > > > > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >  drivers/bluetooth/hci_qca.c | 81 ++++++++++++++++++++++++---=
------------------
> > > > > > >  1 file changed, 43 insertions(+), 38 deletions(-)
> > > > > > > @@ -2387,6 +2390,35 @@ static int qca_init_regulators(struct =
qca_power *qca,
> > > > > > >     return 0;
> > > > > > >  }
> > > > > > >
> > > > > > > +/*
> > > > > > > + * Acquire the M.2 connector power sequencer.
> > > > > > > + *
> > > > > > > + * An OF graph link on the serdev controller is only present=
 when the BT
> > > > > > > + * device is attached through an M.2 Key E connector. In tha=
t case the UART
> > > > > > > + * enable (W_DISABLE2#) is driven by the pcie-m2 power seque=
ncer instead of a
> > > > > > > + * dedicated BT enable GPIO, so grab the "uart" pwrseq targe=
t from it.
> > > > > > > + *
> > > > > > > + * Returns 0 if no M.2 connector is present (nothing to do),=
 a negative errno
> > > > > > > + * on error, otherwise 0 with qcadev->bt_power->pwrseq popul=
ated.
> > > > > > > + */
> > > > > > > +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcade=
v, bool *bt_en_available)
> > > > > > > +{
> > > > > > > +   struct serdev_device *serdev =3D qcadev->serdev_hu.serdev=
;
> > > > > > > +   struct device *dev;
> > > > > > > +
> > > > > > > +   if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev))=
)
> > > > > > > +           return 0;
> > > > > > > +
> > > > > > > +   qcadev->bt_power->pwrseq =3D devm_pwrseq_get(&serdev->ctr=
l->dev, "uart");
> > > > > > > +   if (IS_ERR(qcadev->bt_power->pwrseq))
> > > > > > > +           return PTR_ERR(qcadev->bt_power->pwrseq);
> > > > > > > +
> > > > > > > +   dev =3D pwrseq_to_device(qcadev->bt_power->pwrseq);
> > > > > > > +   *bt_en_available =3D device_property_present(dev, "w-disa=
ble2-gpios");
> > > > > >
> > > > > > I think here you are looking into the exact details of the othe=
r of the
> > > > > > graph. There might be other devices on that side, while the cod=
e now
> > > > > > assumes M.2. Or, consider having an M.2 controller which handle=
s
> > > > > > W_DISABLE2# internally rather than through the GPIO.
> > > > > >
> > > > >
> > > > > This code only deals with M.2 connector in specific, so I'm not s=
ure why we need
> > > > > to worry about *other* kind of devices. Let's worry about them wh=
en they show up
> > > > > (with graph interface ofc).
> > > >
> > > > I don't think we want to go through the drivers using M.2 connector=
s in
> > > > such a case. In the end, the contract should be that there is a pow=
er
> > > > sequencer on the other side of the graph, but the specifics of the
> > > > connector should be abstracted out. Do you know, if in the x86 worl=
d the
> > > > W_DISABLE2# is a GPIO or is controleed by the hub.
> > > >
> > >
> > > I tried to abstract out, but Bartosz didn't want pwrctrl APIs to do t=
hat level
> > > of abstraction as pwrctrl APIs should be generic and should not be bi=
nd to a
> > > specific connector and exposing its internals.
> > >
> > > That's why we ended up having pwrctrl core exposing the 'struct dev' =
using
> > > pwrseq_to_device() and letting the consumer extracting whatever infor=
mation it
> > > needs.
> >
> > Do we have other ways to control M.2? For example on the x86 systems,
> > are those signals controlled via GPIOs (or GPIO-like registers) or are
> > they controlled separately by something like M.2 controller? Or do you
> > have an idea about other non-x86 systems?
> >
>
> Thre is no OS-visible M.2 power control in ACPI systems. ACPI defines PRx
> objects to control power to the PCI devices based on the D-state and the =
OS just
> evaluates the _ON/_OFF methods of the respective objects.
>
> So this API is not going to be useful on non-DT systems where the BT_EN G=
PIO
> handling is abstracted away. And also on platforms where BT_EN is not con=
trolled
> by GPIOs. But I haven't seen DT platforms handling BT_EN (or W_DISABLE2#)
> signal in a non-GPIO way.
>
> I too prefer an API to query whether the connector supports BT_EN or not,=
 but
> I'm not sure how to come up with a generic pwrseq API which also satisfie=
s the
> requirement. If you have any suggestions, please let me know!
>
> FWIW, I tried adding pwrseq_is_fixed() API [1] earlier, which was turned =
down by
> Bartosz.

So, I'll submit a new version incorporating Dmitry's request to fold
bt_power into the main structure.
However, what should we do about the powerseq point? Should we keep it as i=
t is?

Regards,
Loic

