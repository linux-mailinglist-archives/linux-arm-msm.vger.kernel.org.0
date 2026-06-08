Return-Path: <linux-arm-msm+bounces-111659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S057AqZGJmofUQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 06:35:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B69696529CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 06:35:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R1yQn3+s;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EC5moalw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111659-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111659-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36B58300D60E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 04:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12564350D7F;
	Mon,  8 Jun 2026 04:35:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D592A34EF11
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 04:35:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780893342; cv=none; b=ajwVeZXnwrGnpJAztweftvP69PWdbILDS08GVirRaOyJT0V//2Z0Ww7F4gnFmRfvDZR+XK4ANZ77NnmaZDwRO/5HLKSudgsHHjn0dER2fob2VK/CrwnWZiEMX9N8ZN9Hge27e5Qec+SPWOlgcyk4wxUOrN/7aQEA3gteSIjpOHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780893342; c=relaxed/simple;
	bh=kD26G8uJeDiGn93yq3ONwoZDPErjIr20+ejuLcBB5Z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kovn3OD3x+rI1wLyLNi0xkvoSLyKTpMlzlAxr6xVSjajZjx0Qu0+UhHi+72bbhJDlQVj2nfsXQ4t4H7499jIsPHDH6phZgzRq7D/ntAc5u6Eku3IJi2a0Ril3LDnMkbzUMWAqW33SDqvMAW0TpkkABtPXdG4lm3hPWDlAUArc18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1yQn3+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EC5moalw; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580Gkqo1933558
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 04:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kD26G8uJeDiGn93yq3ONwoZDPErjIr20+ejuLcBB5Z4=; b=R1yQn3+s8FvlBOVO
	Cpw7APe/1PI73ssw382rmFFUqPPGvdFVRDD5eGwk3NHkinvZ5Ch4sMHIWd6cJkJ8
	a2uR1JvVD9Xa0q4D1R65I/AW7Wwv7DMUS5WRR9qTeP9Iia8lMivv9BwUxITOsN3G
	/w20jE2DMvQiQPCNoT2wnKDZseD5/21dO3wKYdIiR2SWfDSZVt1kph5dBlMB4NGS
	ymAQUXQGsKLsr6eDnwru+ngU4WBhznz3SRe6O/wZs4D/wcapoTElRAqsJ0ujZboA
	R6E+Ns5l3+4P9jWmdK+qHWbzMKXlUzO/USjhVK7hEFHoZC3TuVL3SFXnKeFYFDRH
	VxojsQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf5xpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 04:35:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0c32faa62so72106725ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 21:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780893339; x=1781498139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kD26G8uJeDiGn93yq3ONwoZDPErjIr20+ejuLcBB5Z4=;
        b=EC5moalwOfHXBb49OmQfyI5167y92h+qMXydweiQw2+lUz4F/J4cI2Goq0MGCnkKi2
         gb7q7p9saz2d+Y4DPa2sCeXIksaE7qD812Xbqb41C8Qz5D2BuZg8PBVWm7w+jhm8k98J
         hWT1QRD5GKp0/YkwdTtPV+T2oTosBdhmHjhB16D4V+eDUuaEUUI4uNtGG4HPx4egA/CB
         aWhdWFGIcrht0EgfsPFbCzBIz7IiY1uBtGP/DB523/fEpGxIMEz+oQKobSIh8C9pZ87x
         Uu3XX8zFAvAM0NfhnSDJBLDYdZ+Qiw55uTD2/hacVLf2H9xthk2XSYDyaWlD/eYe3h+H
         lc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780893339; x=1781498139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kD26G8uJeDiGn93yq3ONwoZDPErjIr20+ejuLcBB5Z4=;
        b=WstGGdkREqYOzN9EQkY1//yw+GFH9aIU7H7FYmTT4nzIlPrIsLP32L9RpxzHWGeiC+
         Dy4/M34iMnTuZusTRozjGpayOelQrcUB9IuelL4fU7GZJIJj7uNnwvM0Lu1fKRCpEv6J
         zDemntgteUDOdldmPjJ4boLj9ksqmtnVmJrQLkwGU2HXnTkGxJyGVGekm4JyQws0cjD7
         qE91/llemWRGlnL1NXT/mw4ILm/X1zmxXmBtOGb3zY0IeqfTO84B2j6oXUQwsg8X46UQ
         T4KiXHbfi5+0/zNmFZl2V8UC4KgQr2Y/P6yvMlHvjf31ug0NVSyr1FeznmzX+yrvo7zB
         9Z0w==
X-Forwarded-Encrypted: i=1; AFNElJ/fwl84syAjOrXlos2avSzsHA3OrdLq2m0Z6kQQeuNIq3AW4IS1pWLdIj2yXQoNimghXlGlmZpmmjGDEciG@vger.kernel.org
X-Gm-Message-State: AOJu0YwDVu1KscsuGnRc38Cq7QAupasWSkA7mZchyz1rWXnxZXpIOB+8
	wQSSvZbnVt8XeiL+UOHBrHTOa9qUfvpUdsVwJP3lXnThq3sHFhLkPw4n8ztUTa7JNhTD8aDmjyt
	I1A/Hfv3UuGCRwSZWwr+xsB6+AubJwsMrdtDvwGLXi28BQhnnygauOb0mNHEivdS0upta
X-Gm-Gg: Acq92OHygZ94ZQd7u9ALiOfmBIwK9ttQzzVwvy6HMFGT4jJrlV73cUNM8PA8ZIRRV6T
	fNSSn3z3fmD7zufwEts/Ly0w2tcdQZAZ2wEO0zqjeFxrdS3JtEY7JgyeSmlcET9ChxXwj8umcoG
	5tfHaLGSdIwtKc73Aq0PsiRm7QM4lS5c9iYtKcRyLV0CxrKwvcQB+HvSwS0UiufMWUtA6CA11Tg
	dDkfUFMLRx/4v8iJHniomtSJ3YdIq1sRAgFtDj5h9qvgxdGHrFSix0M0kAedkaQIKjZ62nFpZ3z
	lkut8VMwV7hw8xZ2WaFfriADoHgU09E6vh2EaM2rq6ta6KVGEO9l9bS4Umpt6Z//4LpbcqFAX83
	+Pf8kn397iU+YRIL5kX3d6lCrT5ZFMx4KbkMfZOzXnj6/3lQt5/cN7b2tfDN2OK8n
X-Received: by 2002:a05:6a21:2c11:b0:3b4:81b4:9b74 with SMTP id adf61e73a8af0-3b4cd0cbd08mr17473634637.42.1780893338666;
        Sun, 07 Jun 2026 21:35:38 -0700 (PDT)
X-Received: by 2002:a05:6a21:2c11:b0:3b4:81b4:9b74 with SMTP id adf61e73a8af0-3b4cd0cbd08mr17473592637.42.1780893338160;
        Sun, 07 Jun 2026 21:35:38 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8630b2fa83sm897691a12.10.2026.06.07.21.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 21:35:37 -0700 (PDT)
Message-ID: <aab3d70a-4939-4f55-a343-4cdeea8915b8@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:05:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: PCI: qcom,pcie-sm8550: Add Eliza
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260601-eliza-v2-0-6b44c9c23d5e@oss.qualcomm.com>
 <20260601-eliza-v2-2-6b44c9c23d5e@oss.qualcomm.com>
 <20260607-devious-active-bobcat-1078ab@quoll>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260607-devious-active-bobcat-1078ab@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a26469b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EOzwYm5HH2NjlfyU_mEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Rw5t2I4oFndJkUnOay6imwBARowekH5i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAzOCBTYWx0ZWRfX1Rs9yTzBsqkE
 t6CsvdpicOV1fsBSitkE/0bLgLCmhze5HTAJ31y/Hiz8j4bRd84WEYIW0kGLqt8Jb0nUoPLS81j
 7w1h16haoyOwjaXVd5RCCik7/5bkKso6A1xRqdhdIShJupZI2l44bDUBJ3jq/VSMWl2ZDG/6V3u
 zI0y6klsjueW+N6oteuQX3L2mpuXLxvPr0zTEAWzobT0LI/rkd4rDa/ZMph+bPw0ySYquxlMOJg
 r/0g1zmt0FLjO9KagNDiF0YwvyFd+VViF9022WIHiw3rUrxLBgzg5K6ng0US5QUZcYuHW4sL9HQ
 qH9qSDgvTzHnT79O6jIpplNipNXxDJ0fY75iHgHsjurUFguU8MxR/kkGGQkXdh943Yc6EERtK3o
 czF9l+vtJPl6FvKkKG1dEYJDlRaLGeI5r5HxwieSzorHfvgeqlkbT8bSDqU1dGQHdkUrAr1La0/
 BwZyww0LSXU1k+4wPMw==
X-Proofpoint-GUID: Rw5t2I4oFndJkUnOay6imwBARowekH5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080038
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111659-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B69696529CD



On 6/7/2026 2:18 PM, Krzysztof Kozlowski wrote:
> On Mon, Jun 01, 2026 at 10:59:45PM +0530, Krishna Chaitanya Chundru wrote:
>> PCIe controller present in Eliza SoC is backwards compatible with the
>> controller present in Eliza SoC. Hence, add the compatible with SM8550
> Eliza SoC is compatible with itself?
 Sorry, that's a copy-paste error in the commit message. It should read:
  "PCIe controller present in Eliza SoC is backwards compatible with the
  controller present in SM8550 SoC."

  Will fix in v3.
>> fallback.
> Why reg, clocks and interrupts are flexible? Are there different
> variants within Eliza SoC, e.g. one without msi?
There are no variants within Eliza SoC. The flexibility is inherited
from the SM8550 family binding and follows the same pattern as the
other compatibles in this file (kaanapali, sar2130p, sm8650, sm8750)
which also have no per-compatible constraints. If you'd prefer explicit
constraints for Eliza, I can add them in v3.

- Krishna Chaitanya.
>
> Best regards,
> Krzysztof
>


