Return-Path: <linux-arm-msm+bounces-104998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDZXLBqz8GnsXQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:16:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09741485A77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 15:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C311300DDEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300043F7879;
	Tue, 28 Apr 2026 13:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYaawt/R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M27yxZV8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE323E51F9
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381441; cv=none; b=a03R733+XoskcvXLThnudmEcHWx4xaHtVxfnz3mvFekDUY4rNjhvvxDfJ7Qay8c8Hzxis7xdoUo/FA95Gd5m2SvkuRiKVAkmlFYKrcb3GcXo3u/jTXJIFPXfBv1MQ3iCykp7MYEmqCJAj8r/HnKYKApquNAxeEQOTB7srQT4Hn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381441; c=relaxed/simple;
	bh=zMRyXcEm7U3cf1SylS8c8cB7KknppFvUvjwhR5g/Q58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IN6RswjGxtpn8UgHm6bniGChEiAAo71qzKg3VaVpUV873rdOdRRwqXU4qRs34kZ0fY/mkyFYX2NdDpUauGrdeXhmxAWKzTRW5uei2ocXC9h9iDBIvlFV/GUyeGXQ/IIdn1p6f3eTV/UOMKwseY0gia04VZP+J9Wj9e5Bn6JeWLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYaawt/R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M27yxZV8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9hdL22045454
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYfcxXBheZfx8BRBKaQOlsw0uRmWmDCtem7kokqovQg=; b=BYaawt/RD60vaCeB
	D4mo3F6HauIskPzn5KMZ5/f+uRXNZFKv7bNjlkhJjHRY9nLVZWHHicYxNBJpcXcN
	C6LDUojPAMnECGglKZz4dhBxCzSC7+8us+wps9pVn2mo9BHuj9FBQCdsvnAK/xJu
	o5YTw5KyX3/30OrX1Ijds7M0MHbjDCSRAmWt1c/hniDczfuDXtE6ZfKQzmzBhQax
	No5I2k1c1pl6wWBJN0voVjSHHKq2RZXrYHHw9jKkmvzj4Qr+iutveCqHeaA0AX2v
	lf1IlPs0EubBCY9dMNQXVwLbq7j10ensLCq+ITCttbUjeu+ArABBxWYFfqttAf5Y
	uAaU5Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgyrq8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:03:59 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12c8ccc7593so14446312c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 06:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777381438; x=1777986238; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FYfcxXBheZfx8BRBKaQOlsw0uRmWmDCtem7kokqovQg=;
        b=M27yxZV82taA05w8eVcSP6VVjVM9uO6KL9pvXrzkDRdWlvd+UkNeSKfr29NOJZvA4k
         ymWrmTiU04nGA2Ez+tNWGhcDofSSAL53NUTlHCmnAux2KD6vO4E5eVP453pYC2pTLk+7
         kRpQZgBw1+D82Ld9RnqJ0UQuKPGtgzAVT5Bx6MOyYCUr+JCPj9T6TnKm3FO8IcFOp6a4
         OABAo4lJmPDlbNTLhqEE0YhsoZDrvRAZjtc19RVaole5UHAtnM30D6Xhm3HCArjho1My
         JP5RcwrpSqxSql/6pB5Eo0xw8ea66t7bWZhbA/o4RCXQs+26gtjNVkomL1OP+nSMSlxs
         C0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777381438; x=1777986238;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYfcxXBheZfx8BRBKaQOlsw0uRmWmDCtem7kokqovQg=;
        b=ZqDCufnV0Qie0BEhwMHqr7A8cPZs8OynNt74exFJqg5QRH1o7ctZ0AeRzhTM+qE3Qu
         UjEd1/hdFU4kreB+jzvDijCMZefzqb7M08hNcD3a6rtEyD5HoVvTSKPs2FMZNOVMYdyu
         7PX9BsrstHS/nXthWCgUT4c37aARsmEL0lPpi8hYaWRsamstQQdgg2gfiQlcv60J4Do6
         9ci2zsfrDjiJt8CAs2IAES7jQk7d8WwvWDepTDNS5jJsvS+X4+yqBNfVZ/VvhYFmnkJK
         +Ic91uupzOGk650G5mYLByMqS9RCAc7hbAwdwb+S0PVfZZv9LnH8D/+rSbzoqgfBYtOo
         zbsA==
X-Forwarded-Encrypted: i=1; AFNElJ9TUhGiMNOJkO5MkFEKAJlw8k1X0o9sNkw5SHuk8YM+68dlatcYQyiOa2oQTzUZihYKJktfRWignYJDUveT@vger.kernel.org
X-Gm-Message-State: AOJu0YyqcUMxXVRGtevmdkpUvxBaYjZPDEmmUvaCsPpPQwT7YEj4RGO9
	3wpbO3jR3xJqNAHFmtTSOCNSJGwj64fO3EOxp9aPIWSMif9nIeoe5ZUjQNKmSt6Fb19c878f5vu
	HzG2enMN5k7JD9lk7kAH8cw24rrjQyNY4WEZn4bU5O0Gf8SezgaBiyYc8ehrBQeXbMF9k
X-Gm-Gg: AeBDieuqXyZPJgDzRwq0UCPqlFreNrpmUcsT04IagQM8j3IVPduhbm5dHaBnh2hoIcf
	ovXAnWsvDAD1UJDViLC+OL6r6S0G7lGqBrfrXBHbjLXrGrp8OB0O+P7CuU9HjJRnEoEF0Y3tzxH
	VUfnkf444BPGyyOwuJJyN6ex8YuwRrI3HbBK98mFAey+vd+KacRu3/beSqBfEGHkwe7nIy90gkQ
	B5csFu6vPNGyCGhaiA2lsF4zGmZ4nSc4nrDJDCGpNuBqdT3hPUh2SWEbYB/7SoD8LzTo6QvlgO4
	73HcaaV6gkCw5IFSUo1oMx71yeT2hK/XAEeRgObwvEvPEEGsJUyq9Q5+3jnfR55qhOrOG10Ittq
	T58o5SMmY4A1YNI3AomsMZBJVSE1Yd4TRmplh6NTISzI=
X-Received: by 2002:a05:7022:fe06:b0:12d:de3f:f3d9 with SMTP id a92af1059eb24-12dde3ff940mr676901c88.35.1777381438048;
        Tue, 28 Apr 2026 06:03:58 -0700 (PDT)
X-Received: by 2002:a05:7022:fe06:b0:12d:de3f:f3d9 with SMTP id a92af1059eb24-12dde3ff940mr676791c88.35.1777381436973;
        Tue, 28 Apr 2026 06:03:56 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ddd927bbbsm2094729c88.2.2026.04.28.06.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:03:56 -0700 (PDT)
Date: Tue, 28 Apr 2026 21:03:50 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: arm: qcom: Document SA8797P Ride board
Message-ID: <afCwNi8L4XhhGRbL@QCOM-aGQu4IUr3Y>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
 <20260427023455.236410-4-shengchao.guo@oss.qualcomm.com>
 <20260428-ultramarine-bison-of-camouflage-99f8ca@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260428-ultramarine-bison-of-camouflage-99f8ca@quoll>
X-Proofpoint-ORIG-GUID: ETRXbmWmQQAMF9MbiJbFuHmi1Mauoqey
X-Proofpoint-GUID: ETRXbmWmQQAMF9MbiJbFuHmi1Mauoqey
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f0b03f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=AQRRnR0zCre0b2-3JCsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEyMSBTYWx0ZWRfXxaXT1xQv4y8i
 Z4qvDvb0mYM6TPY4BtdNKxFP6c6ClagE3rx4yeNDiOoVgK2K1z/VSVW4SgXZSQap6iyNX/Au4R5
 TYxZ3pOiGLA/lXeLGXICjm+0gxCEw+WjYZl6+eSwCXjVqRfVMcsQ6pCfFs6GGBOSsHWoD4paF+i
 x7H8fYG9bE06M6A2ATrRCfMS2EVnW4r78gZGakTcDVTHNea75SKYln3Utnb7ccvfbq3W/1fNMRq
 Q1j55F5+zZbw8sPeRNy7t2282EBHhPF7sjuKYn4GrTFru9cbZLUhwAX0SEUgqUUWDKu1tRte+8B
 cZGDZEZ+qFmP9gdPD+TFgc6q1Kq/M7IpUDbDeF6AllBYTQSPhuLVNwHgoX+toxakfAud2h82p6z
 ciG2049koZpZdxIcKNf+6KQ5DPl7RTWk85FNJHYhGuAlApZ4dgCF8VccIbasUIm1kMjOxqh8rrp
 QiTIICikuc2RJqHUwvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280121
X-Rspamd-Queue-Id: 09741485A77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104998-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 09:23:16AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Apr 27, 2026 at 10:34:54AM +0800, Shawn Guo wrote:
> > Add compatible for SA8797P Ride which is an automotive‑grade development
> > board from Qualcomm.
> 
> This is the first usage of sa8797p compatible, I think, so it should
> be explained what that is and why using it. I guess the Ride board
> cannot have anything else mounted than the automotive SA8797P?

Right, all Nord Ride boards I have seen are based on SA8797P, and I have
never heard any plan of building a Ride board with Nord IOT variant.

Shawn

