Return-Path: <linux-arm-msm+bounces-106651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPKJHhHB/WkpigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:55:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC6F4F552A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B42C3302410C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D69311973;
	Fri,  8 May 2026 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nFBJkwJE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEwX4oID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17D94A07
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 10:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237494; cv=none; b=NchZ3YMhB3fqVAaANg0iCKpkWmBoS5YJY9VArHnjl1DoUhgZwFsqW0Rr7ycbkcBqiM9TJNo6N6XOYvGusrwpfy6Nu49XtG4dyfLQQUxUmBaVr9P5ZMw9iBNdP4IdcHJ7CCwwqRYt5ZvM/HbiPnHZZ8avH8+wUOsKqdgKYU6jR94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237494; c=relaxed/simple;
	bh=wwzccadeRcGMZJN90y1mlKGYEGJ/2kcQqUztPincb9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HXHmtRRA80qTFuUjjeEf4+k7xaxtnCZZbATx+NYF9Pc3sRVSmSkTZHsTQXdnkMYsjzymqw3EbEZNGt4Mp/0y5GxibIu//DR0WgD/IBybPILCSwNlQE+mCNQE+kQ8RGVVhYiDBnn8czaQ79cE1v6zkDUncublwwHgPv8THzkDJyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nFBJkwJE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEwX4oID; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6489pl632770992
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 10:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SnlbWhzc99BCHQfQV7HZ5qYLIwLn+451F/qKPNaplxY=; b=nFBJkwJEVHt9yIvg
	laLbd3aIiBw61/0B6YvlOjCe1XZA4/ab3Z2g7d3FGNaC/6dKkqpuAEpGgKm0Jt8M
	4yxYyIDckkpi81ZxMHJNuCuitteam2UVMmZ+0ZTmgH2Zx7RA+kgjb1W/XW3oiDzy
	myIXKuJRUtU/PY+AbK7rsPFkRv5r1QWk9+MWTdXZ6qr+x/5OLkBZ2SlyzVI60ucN
	Wah0ikU3EVeKV2FEVr9VQz37NKlVZ/8eryvb9yDpdFJct87tsDDTyLKRMba2kUhc
	yuC2HkAnnaJUnyYDhN4GAySxmV/m0IGuJf2PRymnHlXWcJ8Cf4r4kOGzc79uwexn
	aerUkA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0yt5kaun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 10:51:32 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-631284608a7so155934137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 03:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778237492; x=1778842292; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SnlbWhzc99BCHQfQV7HZ5qYLIwLn+451F/qKPNaplxY=;
        b=iEwX4oIDF7HHJeXVxhkFCZbCDV0SQFa3iHie2wkI7vGTJqGyEPPvxdgQsGu+fj/0lY
         zsHZFiciB40F8MaLoOYF1GTA/8SaV5VRDzDFVKDEDuLaaYfwHUPA3Frze5qQ58s/5wXX
         TQCzXzzRC9dsIR36wZ/IrvWC/YcP2IKCV6nq79mCvnP3KKCOok8nLo+xxSgRqzSLIDev
         5eSkdjhen/Yr+Jiv8V89HbGhSJcqeIwb0b1ScZutqTOThSY4IG8v9DFrmYzcRi/Icymp
         Btw9qVUzenAqaD6kRP3O1HcB7X9cS4Mlb+/DCq06WuhXwD/8eyJvisaX8HmiclgcO8NT
         X2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778237492; x=1778842292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SnlbWhzc99BCHQfQV7HZ5qYLIwLn+451F/qKPNaplxY=;
        b=a6N87jJjgVfcXnVXmXKzdzoyah+9UITAsJgorrS8Rc0vhq1I8aFlUOBBrtvipgL+lw
         JWnmOaPhLW7Hi+5H8Yx+l9lxtpUOKSew7fpbRvAkCRoA7CGhr1YNoJ530guPSprvStnj
         MXWq7iYxvDl1D4qWch/fliOrd6RphcX/j7ixUEUlQ8vYPUpFTGxJwIVFf+WZOvjEDgDR
         8B5lnwJ11XLCisb9C9vSREc5bO/MZo3+zxllAq0UGMm+GYZ8JSjSjppbcilrfniCMHJo
         RcOC/+cdiMsmXP/YJlvpiV9Rm8hR37fih/7bm+J/aug2ol0vP6O7NPfFStvnaD6SoCs8
         fREQ==
X-Gm-Message-State: AOJu0YwJdCB9JwaN8DaocNWn30+H+1GVyCWxRcfsSxiHxqq2eAvadyr8
	xdMJrlTZPjYe8LhmbqmgtV+7wMW9OSEuTfgYZJFu2tXrWPdP9zpG5msrA1npzRuJimR+Du1kHGj
	rT3qEg2Ryt2nIcWaU2KaYGOyXlZIYyYz3MOGZ3yZFFeR1Ede0mh1nOnT8kiszBwhNU7AQ
X-Gm-Gg: Acq92OEQ7uyOjiz83T3U2uYZ257p3jO6OtyJmYeoQEbb10yhmqcAM0dQGzDSMYhWlOb
	qdxTgu8Q11QPe4HSJjUBOmIw7oEYOcoIePBsuVqwStT0ydDQL84e+B6nPiboIQHZnDfyaWtXOo7
	0Ca5Jm3b2OSzkON/3luulI+9I2a2us07gI5BA3LgBHQGk8/XcfrhEIvWJPmYg5DUbdbBrzC2cjc
	SbwEp+SIaa193roU57ywz4My7AD9ukNSpGbz1BigROiNFHN7jLcj/1NvgSDSEruDkc/Uks/oQ6l
	ahl5fd7jxin/HO++7Tg/VCJOy4zQJ1srrk04N9azg0Yk5ebyaR4JUcKYq+a8JddXkW7ny0rZ6z3
	tEeIi5FKNnV7nuBwesayGlkC9b9rxIsxgCoyO8okZp9MM32byEqxHcAPufpHyARBpI4tdrN6QS2
	SEk1Y=
X-Received: by 2002:a05:6102:3c0a:b0:602:b87a:3524 with SMTP id ada2fe7eead31-630f9096576mr1949288137.8.1778237491914;
        Fri, 08 May 2026 03:51:31 -0700 (PDT)
X-Received: by 2002:a05:6102:3c0a:b0:602:b87a:3524 with SMTP id ada2fe7eead31-630f9096576mr1949286137.8.1778237491514;
        Fri, 08 May 2026 03:51:31 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac0bce54csm66682466b.23.2026.05.08.03.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 03:51:30 -0700 (PDT)
Message-ID: <486b6e52-6211-41db-a92b-3b8022f53be4@oss.qualcomm.com>
Date: Fri, 8 May 2026 12:51:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] firmware: qcom: scm: use dev_err_probe() for dload
 address failure
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260507080727.3227367-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Dc0nbPtW c=1 sm=1 tr=0 ts=69fdc034 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Yh3SyrHHoMMxgxbEJ_AA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: drQAblW-8vzUdFguCePBXme4jsB4EPa2
X-Proofpoint-ORIG-GUID: drQAblW-8vzUdFguCePBXme4jsB4EPa2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExMSBTYWx0ZWRfX+LUfapxrfmsT
 qzPRJXexDt9lkNHX73hGwXVBd1JAY0pSIjs4lgmXMwu0h32itjbw2lWUl2N+foxLCkG0PY02GUY
 hMq1qpmzmhCCtcOpwxxFSQrKJWsLUZdFES4z9pNUOcOqLq2gssXkStYdgv0p5MjeVvrYjDUS4+b
 GnzRUDllgkQkmOhm0uJYJk/urH2WHpoqJdIMW5r/Ie+hp5L34xmpZEDG4YwwLNdrWBWmVtWJLLO
 HTfqk98TmqWWcI4odger0ygl6qppao7wQ54L8fEscnG+sRGQ8woLTBEIX9j8wi0WQeSJcUMnHRt
 2LPT7qjymX7qPSHSahHFs2IRvxPu66YQ+Owa5OtpkmwJQpjl7WdOH4GkqzgoaFOSU62X5tux+z0
 jA05qagNwKsBGsEBOa2M8eruYY5s/c4DO8VSwvtyaiqPoIV5vB5oiIyQ6SREswNbAKh3WzTewd3
 UB8oDgSaf36IpUL4j6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080111
X-Rspamd-Queue-Id: ACC6F4F552A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	TAGGED_FROM(0.00)[bounces-106651-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/7/26 10:07 AM, Mukesh Ojha wrote:
> Replace the bare `return ret` after qcom_scm_find_dload_address() with
> dev_err_probe() to produce a consistent, deferred-probe-aware error
> message when the download-mode address cannot be resolved.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

