Return-Path: <linux-arm-msm+bounces-91501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHQjJz+ZgGnL/gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 13:31:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 473D3CC603
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 13:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83BA7301E9AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 12:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F050C208D0;
	Mon,  2 Feb 2026 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7jLURql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PkFQXg0B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AB4BA34
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 12:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770035481; cv=none; b=RLlYHVp/f9ADEfDRJUgAxJoiM7agElcd+hIpfuGNuCtbsSIxQvC33GyXOOv3ULzV9PXagxW+CxPyZp4MiLddCHMN09KH/cQPdR6dGtCc+LnL2ZaN1yu5Y9cyk7X7H178w2IwFpsZm8aaHj3evsaoDjapfaQ8+gbRdBJ8/0RXVHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770035481; c=relaxed/simple;
	bh=b61oxYyLgjt9CI/rPacQ6H39Ovf0xqCMsPGFq3ukMYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpcUiSwLSnamINX05S1ktFKEbBL6GtR7yTnKkRYWlgaGf5LrELrY6G3G0HNqwNNayMw1zagzCKjd9Voo4HjIwwMwr0Sh6pqkLOskDvPGRw4eHKs+pvV56LNQIejJoq2I7FMZWpDS+9bteXjC6d1r1hTCgteDNtLF8cdMiIMVtJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7jLURql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PkFQXg0B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CVJ1R2356976
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 12:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqWR2EKQkBmREXTkv9h/ZbuBH/7QLZqcwtBw+8o/e5A=; b=V7jLURqlw9qhAqiB
	HGPog+5I2P+jdUx8W9Q+Fn8tcvpRHQwDtJLYNjMw0j91I+af8siKQjL3ZNxBtCtj
	WohV5J77QZDPp5nQ3TI3agLAlr/OtiYMIwaZjVQMBz1Hktk2D1TvKRGnvkiTOMFa
	wsaX5M2cnBFVX52lBZHnm0dW06/ognQXfjvuRaODGeIgCaz5pHZUNNtTZkP3IltI
	KG/WwgZtZhlVipOkrc9w8mArsLVustG44d7KRyKjOcDQJPMtsxulbgPXghGnfeH2
	iNGq80S+JfWz0TaB11k+bQNluKNaRrvKnrdHwXFUVSWjudrv655Kba1MdCMrLk8d
	3ZZ6dw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0m8008-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 12:31:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c709a3a56dso87751485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 04:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770035478; x=1770640278; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yqWR2EKQkBmREXTkv9h/ZbuBH/7QLZqcwtBw+8o/e5A=;
        b=PkFQXg0Bdg7GwyFDylbGAgdomlVsaJB0kUh0QwS5uvGQLgfXXr7H+PfdGH6ERsZ9qg
         1RUccZDNPqCwXqnjVQtq7NXJ2l2yF30St/7cfriQMnIQ4v+6Em7XYkU5ODIF6qLxY6A9
         M+hpyonYPYj793F1SROZqFwtaJaJL9a8JFqmXXNUEF6ZJkAMHVauVRtAtOidpVYmqful
         ScSw/7mn77FBEO7V9h0IkYdCIhrAyOgI7DJheln4WPEvQXYCICd0NmmJRJY/ztvqzp3J
         8L2RUUN6wmUrp4yDv9sdkRsDnZby32lTHE8B+UZKCIuU24vvWE38iJYrH4xtvM4WIROt
         eRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770035478; x=1770640278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqWR2EKQkBmREXTkv9h/ZbuBH/7QLZqcwtBw+8o/e5A=;
        b=brU5uLsTB4D5LA9YTcuwcUhC2eZwtukrIaICQzByl3mRANlzSes50rvFwIy/rIKak5
         bcp6D4hiAmfyJeKhZAbhwzqHXC6flppTP/9TjeLgWJsgIkxim4q9yVKsHyqGUnxBFRlX
         sdWioh8vXUnQvj2pPDDoCysXFbAL2vYUlvH2hr1Skf6GaEKpSsLeppdFuDGvtLNapRjp
         Y+LTa33CAg9bPABQP71A2MIL07yWAb0n7KB+/lxUPtuZfEbEBE3n9hOvdh7iN/ZB7UQe
         JdU5psPTOjUusorz6JtAsdlI9NgNRzcPVcIOURjOfC7sLnKsd0rHwhHUISJs5Kq+uekR
         79sQ==
X-Gm-Message-State: AOJu0Yz2shxwwgv/lp69R4Pg2pl2ih9WAX4nKhF/yQ27XI6zoOXmeVK0
	cDhIJ33/JAmhkJ0qaI3DpqiPXdCCmMqlx2RfFFxf5EqHz31xHQ/aVD6M1I1tuO3UWrO+peC9rh2
	xiqRK4a4chwFUsCwiAEBKQy72FVo6Qc5jAyUoWuCEZqKxqNlkOyY6vtLOFa3nAKipUvq8
X-Gm-Gg: AZuq6aKKUy9heJHeku2TOFBA4lLXTIL3Y4ERp5lW5bTmeZg0M76i83Td9IIf8XVHzPe
	YAJESqySKF/9jv4irresv9FtqmY7aGhNKKkgJXtB2fqQ2tQMUequGAXtScjI0n7cv+XH+P3EXfT
	bqE5j2xEBMhDpg4z1U9deVQavkad0B+5MOLzTVk2gIlYXnjqa2wFsvc8Ep/QCjrqQPsiYaeqgPf
	1bwVK/yBMh+t/hZdvOQ+CcE7tWRdgOUoUnRmoY9UiGO4l/dgJS0CBdsxc0sEv5mQ/qB/s/VQbLh
	fQrLLzE0vmlDTEauT4Da67aSm4Dh5rBsX0KwQih/kqS6KpkPp1zj5au8F1rvHYRFawZBSd/RJ9E
	RqB3lMhsXvsuoLFzP7rro45+GOKM8Cln7UyYjciEF/M/eah/B0pItSao4/tSQsOx0Mbs=
X-Received: by 2002:a05:620a:3942:b0:8b9:fa81:527b with SMTP id af79cd13be357-8c9eb27a8b3mr1129748685a.5.1770035478172;
        Mon, 02 Feb 2026 04:31:18 -0800 (PST)
X-Received: by 2002:a05:620a:3942:b0:8b9:fa81:527b with SMTP id af79cd13be357-8c9eb27a8b3mr1129745185a.5.1770035477525;
        Mon, 02 Feb 2026 04:31:17 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469d708sm7599206a12.23.2026.02.02.04.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 04:31:15 -0800 (PST)
Message-ID: <19eec3b3-ad2c-4da5-9875-73fe9c63d606@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 13:31:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: talos: Flatten usb controller
 nodes
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260128062720.437712-1-krishna.kurapati@oss.qualcomm.com>
 <20260128062720.437712-2-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128062720.437712-2-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=69809916 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Pu4fqFnyVTvU0wlyd5YA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 35QUTEYiIOstTQmJNfRkvuXrOUB3RZqO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA5OCBTYWx0ZWRfX3aH9EZlgGftN
 3j6m5FqTBlj4Ek5o/xv5u6L/xIACJHAhDgUYryQjE4bdGrYecOS6t8N3y1g28F4CtgtBIudD2G/
 E15AeGvtXYnbcpeTu7fruBiyYiKOAjww+XrBPnyh2QOE6XgnFZ/Du5wfKJuxA2Bf19b/qVzppHr
 AGN5yDCT/6u3Ul1eOVYDYV0Si3mrwPDS3BZGh8/Q3jNcmJ1SWV4Wudk0whewRxBPWcOrkU1/zaT
 5/RBwd7qH/5qaS9ZvNuGyh03+UxmTH1Q1aMqUAfNu6xfx3+MCjD9NMYEbJe/4y6jAbodEqp6QPf
 quPyC6YV+vHhch9Jbv9n0M2+r4lfQtb4rritcXoV3tldTDdbyooMViUEfKXISWoufMPKbiGkXZO
 KkpgZ1CKzY/GVyfk3BTnoCc1njJ1XKgmHhucYICSbTYAYY6WdxQ+h4JODvlTzdPUjOV8C5K20oX
 JEZCAl0Ng5kTkHzTdYg==
X-Proofpoint-ORIG-GUID: 35QUTEYiIOstTQmJNfRkvuXrOUB3RZqO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91501-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 473D3CC603
X-Rspamd-Action: no action

On 1/28/26 7:27 AM, Krishna Kurapati wrote:
> Flatten usb controller nodes and update to using latest bindings
> and flattened driver approach.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

