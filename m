Return-Path: <linux-arm-msm+bounces-103346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLoRL4ya4GnokAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:15:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7342940B65F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9835B30970D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 08:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47355390239;
	Thu, 16 Apr 2026 08:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pbiAhWaG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NFklRcqf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126B438E5D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776327158; cv=none; b=MbdItYMds7rWeT/a8f1TZYW1CnoSy7WNBiIruQb42wavkFNc8HGV86bo2MSfURuEWvJZ/Gxzg1Col3isxYWYpfXmuPgnYHHYNuD26792W/+agGDX7l9bGRUrxR/9CpiZ1foTSB1olFvIYIDh9JCsD/uV5DnBQ60OZbIqMH7VQnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776327158; c=relaxed/simple;
	bh=54Of3e7Yggkod3PjCfn/5W/zJIFVeZdEAbZM5/C3/+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNVzfQZKBaIz3QzxwybS9DeUjC1PqwydJ9j+89CLt4F9XpBTzpvrbjTd+PaLiGoqJMesMX4t8kRm4+iacX4KKndQdlv+EYFgqlkipDony3H3dSrFA9vDc4NztoRokVg3ByYmSHBn1GEWGPFaXoAkEakQ/nEPXXFXVzFi6RrNp+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pbiAhWaG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NFklRcqf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6oh4G218871
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r953mGgqk4U50pCn5KsX+q3XQCCrTox6RKzou9EmIJc=; b=pbiAhWaGS8hwFtEE
	Xe3Y2bZdz3eWJo61Iu64eIgRsN0NrzhsEYR0N+796pVivo53QZ2jJVT5Vu4xgzEx
	h3axH6SGDaMebFQNCgfbQWdV76w8j4JXQ+A2MrxZaqUsu/MDviVhAU9h4Y2g4t9s
	rrvkoIUYr5hDB/thA4JScXRJfSDv1A5LEPB5UrjWRgdBUn5NxKlu7KLuRKsLAiLG
	7HZs821DhUnI+J3f4AtgyuGRwAdLQU5AI2xiR+SSI+8bUumbM/5CiWQcVZd90DqM
	ktqMIacxk9eHtHQmFtU+rnEC+bE0Uwyv+CuqpC6ipxVyNQCKYsS0cpw1wNqUDGSE
	azri1A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtuyg90e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 08:12:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2ec17dc21so51107635ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 01:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776327155; x=1776931955; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r953mGgqk4U50pCn5KsX+q3XQCCrTox6RKzou9EmIJc=;
        b=NFklRcqfDan5wmd5ZGe2JtlutWUKHHGW42ypG2rVa4N9OrgwbipUUFolviX8ha9qip
         j5py9bgtZwoDDOXYcl4EznDnFPgbIb+S7A7RctXxgpNRPYMMI4gwIs8rE5p1wrguuVjA
         MZWj1+Tj3hxnnOPquLSRmrCjwGEw51fH2rpVYGYfHhzP4p/sfnwHiYIdNodHQPzXabDM
         5Nl3aZh/OAYd/rdtUK8Y5kGi0qWfqRRUrw0ZIt/uGopzDGsdOXXv0GWbsAj5xAXWNwO5
         R352rb4gBS+vNPQofg0B8rg9rdOedwjAw3VU1SpqJFX5MJwjr6Jt0rVXouhjqdCbkO7Y
         cmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327155; x=1776931955;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r953mGgqk4U50pCn5KsX+q3XQCCrTox6RKzou9EmIJc=;
        b=HI5+KjYVN0WWWpxI29k58O51G003Jh0diYSfcP4ku2sg/jHw3NOwam2KdhNu6+w+Bw
         JNKkK5I71hWo6zWLbIJR4xuu1yDDffdqnhDUzgmomuxESUcTXX6tvlLsKpVAdQQz7fEU
         wFu8yibJ7udVz/J/KWQKk/mhUvQPQUoIIXIhpUMnrrXIWWxRAzO8all2Q9fuc3Ehe7w7
         J9wj6bnxu87eVmF4nhn7oMbhKHM4wMumjVQW4I1SW6bNxRDzlhQMV85h7SbZnfpY95Bc
         r61/iwktF1OYZmUlxBSpKwQY9W+ad1AGEtRMG31BSBGdS5shEwdCFvc39hzKAnqjS3aN
         ADXw==
X-Gm-Message-State: AOJu0YzhF9kznIdfKLDh6Lknto3nEph3NKLcKysF2ESW+NQ538pLqh/e
	M7Pwb2IG8XwivsRjOvOFd4RC4w78Kaw7hhOWOjBlLJs3vC/DGN4exb1ne/6giQG8b98KLKsfL0k
	gjFQMzhKrwr9ZNG045NDrdJDPXZgD1V3nlPP97EP9+aPt945HXJAh59eMZPlo55SU2CMJ
X-Gm-Gg: AeBDieuMkBFCbsyI+m0fu9u7A0lxTFHcXypMKnj5at5TITd12wsflUI0tRNV/48SFF4
	F6pdAoIEQROIMOjTei3nZSO+XxXqCqCLBveUYv8FYOXfV2rW1ModkH0ry0kOS1nrkloy14yPgZO
	LrTlnGekvQF56DhsiUCvk+Yvxn38ygBTKXu315SWfThc5F92DLBxWmRAsuhR7u4xavWzrJZ97aM
	PNVqcmNMcAhRaGaQln04BPsZtMvQfrGWj3N/IwJgMpc4pFlgfCBUiOSCoa++LhoFf4dEXs+jBnk
	gjLOJydLHeCVaAo5+3+lMKKKsxEnDOolyESGUZ1jlDR4IXe1QNrwpgoIw40CoJGJS8AMjzQq/3i
	Vc8068T4BXvVlsWxai6VVPuWEWRdKBjWTkc447dOcNua3ibivcCt3PxijuTSrHI6atQ==
X-Received: by 2002:a05:6a21:1b8a:b0:39f:27ab:2438 with SMTP id adf61e73a8af0-39fe400280amr30057454637.48.1776327154858;
        Thu, 16 Apr 2026 01:12:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b8a:b0:39f:27ab:2438 with SMTP id adf61e73a8af0-39fe400280amr30057414637.48.1776327154405;
        Thu, 16 Apr 2026 01:12:34 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957eeacdcsm3808209a12.11.2026.04.16.01.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 01:12:34 -0700 (PDT)
Message-ID: <3cb86208-9536-4153-85a3-32548d66dea5@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 13:42:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: add Global Clock controller (GCC) driver
 for IPQ9650 SoC
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-2-b37eb4c3a1d1@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260415-ipq9650_boot_to_shell-v1-2-b37eb4c3a1d1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA3NiBTYWx0ZWRfX2bZxNmPkVvSW
 BuV0TmYwg57S+iPCZRGUnB8Ue3lGNx1fzAtgSUFH6Wl8S2HrjMni7wjE2H5dkTzCCxzK5no8QDk
 ySfO2FRsZWTvmdjxsaSIoHxbp9uzgR9BZCYLEHvhaB2VWfKFpEDUctrn6gn/5ivn4Yeab4vHtPt
 5qAww/6twx6lrvcDvgSrtVH6KfcWx6KKWCC/kanEHmuNYit6DlTqIEunaefv4BCEKYU3XMAYMcx
 5a9M6oPVWnM62pcB/PJOGG+uuMozRtBsUNaD32GjnKkKt/8pE7XVT0zc0CFgOKZiT+HIEqjvpx+
 QBkPOaa0j8MsJGqe3pfqL/Fpw7A2OWxST+PI5BQoquovZXN4+6aaf4HruiSYJGpi+NNgCqc318F
 7RhCdncnb/eJgmLi34E7fa8n+FjtyQAGsvO+JsHgV4bMUzCZz08KefFHV4r2Xrxu7WBfTT/tbeX
 MVx6Ksu9JeKaRt8lqiQ==
X-Proofpoint-ORIG-GUID: vWxMijTvSsujsrAaIxnQkbOdvcS6APGq
X-Authority-Analysis: v=2.4 cv=Ipgutr/g c=1 sm=1 tr=0 ts=69e099f3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=uiKLQp9ku8skNrCTpKwA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: vWxMijTvSsujsrAaIxnQkbOdvcS6APGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103346-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.c.6.3.0.1.0.0.e.4.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 7342940B65F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/15/2026 7:03 PM, Kathiravan Thirumoorthy wrote:
> Add support for the global clock controller found on IPQ9650 SoC.
>
> Signed-off-by: Kathiravan Thirumoorthy<kathiravan.thirumoorthy@oss.qualcomm.com>

I missed to cleanup the CLK_IGNORE_UNUSED flags. Sorry for that, will 
take care of that in V2.


