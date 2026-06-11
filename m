Return-Path: <linux-arm-msm+bounces-112745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F2gkHcSeKmo0twMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:40:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 054C1671759
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:40:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hc4HJ36z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ixP5SY/n";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112745-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112745-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FF0830C6C13
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE8A3E835E;
	Thu, 11 Jun 2026 11:37:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6EC3E8321
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177842; cv=none; b=X9j+P3RnDdlMo7vA9ya1wix1PlTjCP7dv7JOdaB095zmVmDjMSgnOijasol4q3bttB8Lb+sBYtxnhNvByj4Er60qcH8E/NpA+QOPUavnXrmzM/bpZ2iFmMifWsOp8hrTXyLJKxfrnTeU5GeAJzJv3g9MWLA3UN5JIdFNhwBHTC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177842; c=relaxed/simple;
	bh=wxd0z1K/jMxfFNLgwOXIm4LHEBf7fMJ8Se4Mlgv2iBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9aqWwzSKyEYhIfmQwKCUC+/4kWRUhdz3OqHuyYRqUpZ5QHX/lTIhAfCclCxDI+RNzbdq8tzX55mE+XH0dZuuXHR2Sc+8fCVd2Bm9HhuisHGa1rA0AtxwTzXbTYW+gv7Xpcp3PJIkwJggpv0vXRqTgBfQHl5LcZh8tqh3Eb2jnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hc4HJ36z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ixP5SY/n; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xRm2174135
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=; b=hc4HJ36z1a6qXvH0
	jMM2ZpIRPA8arwrba3dIz999binhr9pGCvi9ZWYazUqAiodNM5z75MMjecQS0GKf
	b0FlKmNrpjpXh1yNywIwz+MbbJ009EnM9TtSWBoqcTH29Cz9xbj8CZO+rtiSiF66
	JqYdtDkhVnzX88rdiIC//LqSCpSldaF7eTGQP9gxuv4X+DAj7m221sqlbl+4xbCS
	oiqhOPiMtrCPCTHrIW0ERp5GmEIGZrBAAhInGYHbpOuWveteUe8YsKtxIh4sMEZT
	+WGQmOk61lIdIzUKLkVUAnwBJLmAQpwgt5k0AKrPgmz4tJnNp1y6ywcR2AERb2pu
	94bRzg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vb42p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5178ded346eso15813151cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177838; x=1781782638; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=;
        b=ixP5SY/nsIlQATX8QGg9uMCh/W2FtQsUsnlJuT9KxOFCDfHzbkH8Sk787NdDt/Q+vA
         1HiHAws2V2vzJ0WAr9bO1StZbxHcFjtbYyhlbFXy4WiUIz+QNvRCMcXe9IfWKYBQKAVm
         VOWAYgD5vV9uEVBFRlZmffhR5fckhTzLU9S/SiEBew8D7u/5MofbV640MdRYqMcM7CCM
         Yjus9XxpaugkW5vKceqT8JbQc0XIPMFgMFdWbdfU2col7ZJdZt3onT5JWoiymilQdbOP
         O5UyEUdzC9tFs9rXL9nmnDtLdy4BVR4rQ/HmJRA8npN+K8l4BfJuSfqx4mMcZPGkQwKH
         TnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177838; x=1781782638;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNFFQ8ITUaDjSLXfpTnELXU2+/IZ+KPg3CtsndZrQvo=;
        b=qdf/wNQrNkjv+5iJOEI0Pjtv8JwJGLcUtYY5k+Az3fhmrKB5B9UQjR9ibYxVUnKkye
         KrSxLCHeDsHKPQQLv9+KB1yXXVZKEMCU1UD42bytyH0pu/jiCgmCGv6ig7u4uuJ/q3cY
         MCIKpuhX3FfgmaUtYwr5jaUqxdG3azsIvXRpx8VCCpKWtHevGRJfwKtGI3zoVq5/BCOm
         kdzbO1v9UYwBIdi8t9ZRE56/IxbIhR9Tt+Giq3glV60VJ43EPZx7dz1USPcBUeHfLcMS
         Jvn05isBJEHrmZy6n8unZttH1cxrH6mBhOi8wj1xGz2zNKH8YJ+M0Rb2YgqclRICRyQZ
         nUgg==
X-Forwarded-Encrypted: i=1; AFNElJ/d/+kPJiQKect3xsFuE0LE9l8/tdKFcooV3pWKl9Dp6Rk96oGg5kY5ldMcptN0RLcRGIvudoewewnibeLH@vger.kernel.org
X-Gm-Message-State: AOJu0YzLCw7oF0zAI+WneEe0+Kn4Xn0ueK4EF/TXJ1T6zy4eobLXyJG4
	bPbyqaz0edhf51F6YdwsROOoYHNw97IcHP29aS8CAJJRnH6tBoxu2suX95tV1fBE9U+bW91CQWE
	QAgbcv+qEsz5+HarLY/2pTVaA4NzaWJbrFKffQtsmu4Z4bz4a7zdCkb7UYZXKBTsvZGKh
X-Gm-Gg: Acq92OHFlq4r6al8o6eNiP/z4a+mHi8GL+wT/kTM+ONG1s/Z6tgd9Jk4f9QZF0XLh8i
	JQSH9bDWv0GmL+Jqcex01ziSKHHs6H1TIQFNmD4YAdDZQMXQ4o8o9PneweU8cFajGXNd+KAvKCV
	iEjQC3Fv0hG7BvThv4WUZPCnFOdN2IS/8w1BI25gHGOTTXl2pIuc4FWOx/j7zi4+PW8bGPUQosF
	JMwIV8fU6AYj5kRMlj8Yw22zgLx4+5Klq8ycSRmWKCAnnOnsY1qFT+HiuCkbIJgJh3+ypGwHesU
	6WEwq7cLhPjfrIZIB4JItUYw3mUGx1Q5ivhn3YD62Rr+rabq0iMV9YAQfqsyAJbtYPvL0eMgkW+
	o3j52Trby8ka0pb0SU0UaqRZr2v2n9B4qQb+Dlf/n+vt9PGyW7YMCMnWH
X-Received: by 2002:a05:622a:4d09:b0:50e:487a:bfef with SMTP id d75a77b69052e-517edd18bb9mr23051131cf.2.1781177838592;
        Thu, 11 Jun 2026 04:37:18 -0700 (PDT)
X-Received: by 2002:a05:622a:4d09:b0:50e:487a:bfef with SMTP id d75a77b69052e-517edd18bb9mr23050661cf.2.1781177837768;
        Thu, 11 Jun 2026 04:37:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f147e2sm53745066b.7.2026.06.11.04.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:37:17 -0700 (PDT)
Message-ID: <60b4b36e-8752-4e52-b5a3-aecae7986730@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:37:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/18] arm64: dts: qcom: qcs8300: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-9-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-9-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j5MfqCj05WuonBUtM2ujDvyMRMiMix-I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX+GaiJEkDRdZC
 DwKEtYZVXlgsAw0518J/XZ9DPT/AywJuZIgJJPHuULIpjDEEayEgR5yxhi3Li9iT2rgx5r5xcPX
 /Wdmd3s62hRNAJV/vuqhLBToPNVn2oM=
X-Proofpoint-GUID: j5MfqCj05WuonBUtM2ujDvyMRMiMix-I
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2a9def cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EbZ0H_4aSGrsEeNKfi0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfXw4B8bOrUyaqp
 /Poey8our+vZ6QEMMMqLGYxclqxmzqHSAZmLvezTCwVZqyqjA8ZBpfl4IfrNXWG0MdrJMCP1P5f
 1DEXe3TDB2GP76vbXuKvMsAzpRcGmYrRqqB4pw3RhwGLwH8MLIpaI7CeNJsuTylZgy4Lb4HjfIl
 dSm0uyLDAgTnhBwNocpnqNsAAVGEdUIj0VWURqWVhywu9ii6z0NX4aDpW/bbNV7OlEcK0jG4s0B
 ABtUGDTtERP87YL1/+DrZkYa4JlNMYDAZ2U80Qpmqeln2ja9/iEZ6/0Hqfq1VjqfzOB05/BhT4q
 sjLuJw/AqEykTTAUEjLQDe/Tgt0hMLg+X+Ns3+BZ0QjGy0Vr3ooYE/PkQ2jHxyWxLJ9K6FejV0W
 63qdF3SYFmYarZdtTTPErLe5JW5M8vtuY1ywGVQhWbUTCygJ4ymtE4obX/ALoTTjnpaQQ9hbf2e
 /VQTPYleu4qdudcCJXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112745-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 054C1671759

On 5/22/26 9:49 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

