Return-Path: <linux-arm-msm+bounces-117129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id so0HJuaSTGrGmQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:47:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26557717928
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:47:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OkLGvGfi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZRhsItac;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117129-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117129-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF4B830794FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF093859EB;
	Tue,  7 Jul 2026 05:40:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B5F3845D9
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 05:40:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402841; cv=none; b=mHGnSVLAzwnORVTRLUbUCZ19s9+zrgwkTLCNwkVihZXPJ83x1bLvhr0ZcC0qBL52/uwIUasoGXzXyib0z6oDhIUZsbK2/bbUYOd7lpeaSsI06EON8tFeOmHzjVr/rqZHccVe48qxgGyRCuq41eNxzl9fR6mHxveZ+Bz85lTd5vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402841; c=relaxed/simple;
	bh=2tGlw8u9Rbdvgrkw3LNp7XhIeWAt+H/gpCH0Q53MUZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RubrvpgHgM00OFDqYaxIrA7C15j8nVhvPPC+Wxi0PhPl7bbmDWC03sP6o0HndisW4u+Y3R4GkPY2HztO716lPjz1lkhGsd+3u1xiB0FHEgdm0tbE6JAq0c1dN4TapWwvuyAqHXOLpwG9KfoDfIuFUpQ4Lb/SJmw+vQazExCxvJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OkLGvGfi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRhsItac; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748pIZ2687448
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 05:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	09/2e/voBc+DyuWudh1rLfEp3vVKAMHxiosmb9KxU7w=; b=OkLGvGfiGBUgG5vL
	WKCnDi1XODznle+cnWEVbG5R7qSGM70OtRurYEvAwiJCD+RIvG1WtYODlMwQQEnN
	qQ9hYtbJbj99NQaP10wJwkzqD+sOU/HNQZsb534UJxG9HK3+xVjY4yaaVRfmtdje
	ORIEEDJqZ2bNn9dA+Al1WYyRO4lZrzcYWK0XLHOY3HDyv7QjrtLLuMyu/VrQDZAR
	tT5F6hR+cRv/0GI1pN5UtwBbE57w4cEanivdkyM6yHtVKTlFVDWGhenE2pSB4b0A
	EE/YOdy5InErfZRZPm0EPoj3RVOuyJ3XYn0+M8PA27JOqWFRufFFet23H6RWz9tB
	a+1Heg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gvb8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:40:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381e93bfcacso8345062a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783402839; x=1784007639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=09/2e/voBc+DyuWudh1rLfEp3vVKAMHxiosmb9KxU7w=;
        b=ZRhsItacYmsR3wO9UJE2QqiLZzB9BRiBuG+vQVlk697EOjJIIGIJSsvYpKzFNCGKZo
         Fg3IL5QQv7/Y14qhMT913BWD0JLpW9p37aymGSK4qpP49m+F/Atj9QMeVqYCZptQ9b8x
         B35fv68Qq6LTnomfCXqXQKPMlfbFT7GFJ8UTiwoezFIKtC47cKrEcrHnwFvEHMNoha2N
         a+KJVulwz9fRb+CL8JFk8u36ZgXOfFu6ZGDUpQV3NzNZMz/gHtG9CcEPlu2H0VfhcBNf
         DI1xdTEffKgpRI/H3Fegjeo0XKq5Xgr9uyXFC9K19KOV381pAtkx+5A1VNHYCrpHEKwA
         AGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783402839; x=1784007639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=09/2e/voBc+DyuWudh1rLfEp3vVKAMHxiosmb9KxU7w=;
        b=EbVF2lEku8Tlhpat23HRKhgj+wbu/rOA+JGbmWwOxp3l0tMZS+GkAODlGE0W8F9Txy
         sOAaWdJKQj5gdoPsREZjLlJR0iEl7OBFqBXT1GtGtnhVALlq33psIzu0iq4u16Ra2mpW
         V8PZ7bBL/qcig2ePXBHU8d12HTDAYioOOVb/eQzBWiOrBEQqZRIrRCoUMJWgnNJu0gHC
         /IBDO1Hz3p29trXTl0t1L5sZNIXcWRxUXL8zYESIeW8nJRFJs74VJVkIH7AMVra99R33
         7dCx045wjDqWyI6WA/0lc08nGgrYaZoA9kWNDWf1MlUvssXp/IdzKdh4PiF/8vAPfBKJ
         olNg==
X-Forwarded-Encrypted: i=1; AHgh+RpI6tjomi/UX4JFpDmKzdH9jbTDaJwNuIYeN6xp7pjhT0aZ8f640G18t5hBeBoGnTtB/eERn+ji0K3S0hd4@vger.kernel.org
X-Gm-Message-State: AOJu0YwseWtYjHP18io16748UrUP/tMDyDRCsdPGifgyPkykaZ2FvJm6
	rPFgc3ulqRj/3EqkR3Wr9TMpnD+nmmHMvWStCRsgiS2+3Y12Ivwoq1kZXc/gHX2vDVC6RPmUiJH
	E4elilfvipX9FrBS04I0IlIN1PlupPAmCj2lIH430riuvoYs6VkmCDusaGPCdp8uovEdo
X-Gm-Gg: AfdE7cmC7srkBmKH+YJinpYTP3AVSzAVGhx0W0NBGuL/wOScZoMTT6dHctq+WKX0VLa
	gnIgIOB/MoeXT4yqZ0/K/i46ni3fPvQfYWuWVRAwwKbLm0ReEN5SmSatuDc0lEpctcYsXnDBtO3
	bDraw846XScaHcXOEStnxGgchstgPOl7DrLFtYRuTOpvfFbH54H1ReCg/dG6bfyLai/sE+sGcO+
	z+QrZWgHmHSgV8/uK6LoP6kPJ+JbUzRf8tCr5WKl9uBDFkBcWxMAlMizZLFX58HT+llFFGgyvvw
	dmyeaaucJ15CySExehNCXQ8bPrclxT07hZphC8bJ4l7aqupBh6//ArsBnhM1BqDklgTLRtMztXR
	AdLdgNCAoKawGt0JE49iSLWof3vZN0ihjGEVXtbbeJE/BN8SQ2T7e3vuN4GiNHvNJq6wRKW6AMx
	RZqLGP
X-Received: by 2002:a17:90b:1cc8:b0:387:e0db:3fb1 with SMTP id 98e67ed59e1d1-387e0db45bfmr1432286a91.42.1783402839116;
        Mon, 06 Jul 2026 22:40:39 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc8:b0:387:e0db:3fb1 with SMTP id 98e67ed59e1d1-387e0db45bfmr1432259a91.42.1783402838621;
        Mon, 06 Jul 2026 22:40:38 -0700 (PDT)
Received: from ?IPV6:2405:201:c409:b03f:6d0b:bb83:7a67:4093? ([2405:201:c409:b03f:6d0b:bb83:7a67:4093])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d3c6bbdesm432182a91.16.2026.07.06.22.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 22:40:38 -0700 (PDT)
Message-ID: <8477653e-cd5a-4e8c-bed3-fc1a1e21088c@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 11:10:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: shikra: Add PCIe PHY and controller
 nodes
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260630192944.GA224708@bhelgaas>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <20260630192944.GA224708@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uCiP2bjnLa9n7Mk53pa7MUyk8ibmRlRZ
X-Proofpoint-ORIG-GUID: uCiP2bjnLa9n7Mk53pa7MUyk8ibmRlRZ
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4c9157 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=JUOmGHd9cyzBAK8M_EkA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfX/8JyP2mby5T8
 Xfqulz7YPKBYiNFnGg8hyQX7pH26yP/YD+aY7dz3YDwontrgLQ6Y72ISHa5vdv+qeMq8HF1FRtA
 nWwUyjHuagKEBoV14olkrFo1ELq8y7+YMv/r0hXItsIR65ITaG+FlWeDRe6w9cDAYJUWZjcpNx0
 HalJ0927/wE1AM0dSYA9zqD94VewFEeP+6XSPkUWNGhEdNqWAooTYfCmJY5xcVle7zH8J7Q5E3P
 lCkJJ6JuE7CT0SHLiS0lhrO5zt69U0Exrx8A3f/4pr3n1aLm0Rp/I1ayX08rMpmdYL6AnmedSjD
 DdC033LRA4wOyDmK/V0we3iHqQZxavCCa8aV4QW2GBD5k+bJy9bxPC47gHf+r1/pG6VkhAdvO0C
 DGAFjqJ287SvaKC8FJCHpKyB+GcevdZemjGMtIWFSd7AZ/RJ7++L/Ez+idrNh9ACs+pO8GS4XRw
 wJ2q8euEhDIPNamtNYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA1MSBTYWx0ZWRfX/C/7xTSiePAW
 GE4Ti1QoJQRmlc9O0j8IUU4WksSSn+GGCxsdFvCbJtq9z08iVfI6XmR5qyqJa/VXY/PupY9tLEC
 fPEeSDMaAByf2JDsyrOWRefOCv+I9+U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117129-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:andersson@kernel.org,m:krishna.chundru@oss.qualcomm.com,m:brgl@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sushrut.trivedi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26557717928


On 7/1/2026 12:59 AM, Bjorn Helgaas wrote:
> On Wed, Jul 01, 2026 at 12:32:49AM +0530, Sushrut Shree Trivedi wrote:
>> Shikra supports single PCIe instance with  5GT/s x1 lane.
> s/  / /
> s/lane/link/

ACK'd

Sushrut


