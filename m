Return-Path: <linux-arm-msm+bounces-96505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCtrGujEr2nWcAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:14:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C013E2462B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 08:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47A0C3055DC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3763D6CBA;
	Tue, 10 Mar 2026 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SF7TJVL5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbBRdrLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D543BFE2B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773126885; cv=none; b=XRRjaOnG6WZ/1P1HYKMZwFRMk6Lj7qYuZ1q4qT/mSGQEysAoWDvoVc3C1PPK5SLyUSkpRILoC6n151iZdv/vSxwvK+FsGz1mLck5W3jnSxPidNTa7vEoQItHqAW+k34X4b0VUw/6TfDjrXSPo5Ie6ZSgEShDZydv+Y9fE7MMif8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773126885; c=relaxed/simple;
	bh=eodG08hd7H2+4eEqRidkXn2k69I15r4MG0U60TKAyTg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=daD9fYnaQa4Rd6Q0cmQvgFmPFxR/O2zYJFQBF4iw13cU+LZqNe9tx6ZgZlKdVeVCcgz6BS96r0tUQKI2MShHEhdcELg1rqaQ13mOL6UC+mC06v1J841GUAXwsLDicArWGA8bYWQdsd6n8ZFlf2Vj/jvZqnvNdqhSdwAugspxPa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SF7TJVL5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbBRdrLf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EBAJ246495
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WUk9/yYDjpm7Lct9/O3j2FSRijHPmYsf/qPfBafPYuo=; b=SF7TJVL55NJvYKm7
	0LmwUKTDG54qxXVWyXbilLsMrggjcfzx0t/wvsyroAdGm328uW0PnybO5LsvN8to
	XZbLKhsZ3g6dIUW5FXY+0mURtHBTSo75+iJlN2YUhvH30JMgGpF5DKz7xHAerq7v
	hP5/4PdTGu511BHqzH1y+DnrjRSliDpuhUXmuPY8OPhysjI19Y01OW2ZdY2SYAbA
	ZNTzy1AFegGNKHphrK4msRiCL1e/DioMr1o0+iVQfVyBu3Fh0xJJh3fE0HVyu2ax
	nnLZ68yOUk4OnS2pB6PVnrAJ8IaKn2ZHJAGwX1HlHs+o2+H7msRzPTnfS2EPCGge
	knaQpw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct880193m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:14:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae5031c6c5so446049855ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 00:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773126883; x=1773731683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WUk9/yYDjpm7Lct9/O3j2FSRijHPmYsf/qPfBafPYuo=;
        b=jbBRdrLfPNvwg0Oi3ANK0lTmS7pNItgb8osu07EJ7+OZKdeVyt0U960+neFaKEhLXE
         TcuI7S/pBSWZiDCJ7fOj1H1PQZc98ijp5z9q3ZX5oJIriNiv6OwGXdvGHPV+H6K5aq6e
         ZUEPAJYq847UOH2nKSqE3sJS+pyHc1NiDOzjG+PIaDQL3MipgCo3mmT0Hcy4MJXR7/Mj
         ttpNqUKSfleHjUL99w+e49DnhpaDBXViqumx6rq8duJ7he7I6t3Xso1seTJYk0cRP8aJ
         NIRRqGElO7pU4GRa2i/enX+Bi8gG945CQOlHAfpbmcdKbYnWKYTHqkyShO1zaRfAt2lX
         XYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773126883; x=1773731683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUk9/yYDjpm7Lct9/O3j2FSRijHPmYsf/qPfBafPYuo=;
        b=mBsqbmpi1V/VibFDz8ACit0afaV6Hbe2MxZpEMqT8wf/RF0pufvhP+x/Nlw/0JVtEw
         nC2NxSmEsNuto4frod9aTYOWVZqYTtKc2aeUIlerMDh0idthtsOkpttfKUGR4nWoCCyz
         v0U9u7KxdIYibGxXM+juPhNqhpUh/EkxuSGrbHdrGRgJj0LGGxnmqCu8Xw5UChdLcH5F
         esIzHakudI030uT8RbgYfBFZ0KSpHK6fOkNnf5UAT5R/2RSjnlDMsWVIwTGvxvgHZbpI
         Ec7pkhl1WhYzxNpaVreLckg6qzbrUwR+rrRPZVRJa6+j0WD8DlAeNf9XLZnBKvfJk9W/
         I6eg==
X-Forwarded-Encrypted: i=1; AJvYcCW5iXgciKOXH/IcddGHlXZv7RfHE2LrSVBDC0/xawIZy/jg3dSEdxYmMkvV5JtVD0E5kDUglOf9sdTzwsAv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg0QC0dqEc5RNbbRNCR/v19FMdFDBpgJDR+RbNtDQuE6CIMr8s
	GvVEn3xQOxPE/FL0VJDdiIlyo9Xfu+BbVYYt/g22mXk7NZUnN+ONv3ld2kg6H5de6oHq67a7spV
	5CFDeICSSGuYrzvKaysL3gpJ+rGK+vhagY2sxnnUJpYIcKO5mMi80e0v0FSfohU02L4+20vHcep
	rXCSI=
X-Gm-Gg: ATEYQzzo5jehZkyn5cQgQx0uBTlbbwaN/PSGQwBl9kOBx1iRuQ8TjN6qGJ7e/X6MdoI
	ynp2yghZNa4q+J3/GRPUHwazxjftmQyf+6CHK6NvsFMsJd5VKlASErl8jKE63JLgPOn2SPoNafU
	MhfGd+ck8oy2zQHMh9Mztt16DPW48Ndl4K+GK5m2uVO6DEFNxJUP2MPv7fEm4or6U9rANsL/jz+
	NDKzIooAumOObUhSXVnc+TuPi/QMfPFnjMu2Laft9ODFo47tyCtkYFNlt8Iu+5NRZ8ZRFD/wqG7
	DBTB2TYg1MkGm3DKHPJyK6cN1kiNgPGotZsjcPOXry1dfly79Pb2EUc8kROketRZbCeyzXfMHBX
	xaY9g2zI3pqrMJy9+RQJ0S5kETrA00l1B/QYyeGzFxzxY27E4VAEut9I9jvrs9OnGTWXWBQg4+p
	9+V00bYt6ZyWUjMJI=
X-Received: by 2002:a17:903:2288:b0:2ae:5104:571e with SMTP id d9443c01a7336-2ae82366c4bmr156151915ad.9.1773126883437;
        Tue, 10 Mar 2026 00:14:43 -0700 (PDT)
X-Received: by 2002:a17:903:2288:b0:2ae:5104:571e with SMTP id d9443c01a7336-2ae82366c4bmr156151655ad.9.1773126882992;
        Tue, 10 Mar 2026 00:14:42 -0700 (PDT)
Received: from [10.249.19.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e5c167sm134165345ad.1.2026.03.10.00.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 00:14:42 -0700 (PDT)
Message-ID: <c023b313-ab57-4fcd-92ce-c3ef3be95256@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:14:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] media: iris: Add IRIS_BSE_HW_CLK handling in vpu3
 power on/off sequence
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260306-enable_iris_on_purwa-v2-0-75fa80a0a9e3@oss.qualcomm.com>
 <20260306-enable_iris_on_purwa-v2-3-75fa80a0a9e3@oss.qualcomm.com>
 <owwpmly6i6djvocnd2co42x67a3xd27kxem7x4hl462n6t6dv4@hpjljecmrlho>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <owwpmly6i6djvocnd2co42x67a3xd27kxem7x4hl462n6t6dv4@hpjljecmrlho>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA1OSBTYWx0ZWRfX6xvrYBoFl4tn
 yTUabx5rqookeXnr5Qwpog4xxkHxTh7rdx5jkNDBjrXyovPDlQBr8gHjaSkiP4X8aCkos6omzZh
 BBp5aGGO0PIv8TT2I0boDqEbtRWBWeb91dX+OKgwneov/tfRDvgMXarSMrNghLKBN4Of4YfmxQW
 LfEkUHdsqe0vTJhd9WuoVktxiF+VyHMQK5x7Q84bgJ9URd4pql8EKxD5zC+OTvbZaTO7Fxhzxty
 MbsynYXDng9m8SCritj43WimI9HrXz2Tu5TkBrPfx5ZZkqu/aFK1giVIrzIN7vaF5ogdZ1SW7R0
 33hNBWEvdCXt255+jf6KhLfvTy+ZnhLk2PTtB3uOlHaBZnOQKEyMItetaiSUwMxELyqXEojoElI
 5sjd2bYdPQVAEAYiwZCBWfQ7WCuEC9jV4ThgzDLQvkRBo2CZbpEiNnRbZO89Qv97xiWKA59wiCL
 cXF2ayENoWmyXxXXBPA==
X-Proofpoint-GUID: csj8-caoBjKT9m9zmTgf8zA_IWkQFVHt
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69afc4e4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pVNGaCLpK0EqxE-sEXsA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: csj8-caoBjKT9m9zmTgf8zA_IWkQFVHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100059
X-Rspamd-Queue-Id: C013E2462B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-96505-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2026/3/10 7:58, Dmitry Baryshkov wrote:
> On Fri, Mar 06, 2026 at 04:44:31PM +0800, Wangao Wang wrote:
>> On X1P42100 the Iris block has an extra BSE clock. Wire this clock into
>> the power on/off sequence.
>>
>> The BSE clock is used to drive the Bin Stream Engine, which is a sub-block
>> of the video codec hardware responsible for bitstream-level processing. It
>> is required to be enabled separately from the core clock to ensure proper
>> codec operation.
> 
> As far as I can see, Purwa is a one-off. Why are we forcing support for
> the platform (and for the BSE clock) into the generic code?
> 
>>

So should I add a dedicated power on/off API for Purwa, and name it 
something like iris_vpu31_power_on_hw() / iris_vpu31_power_off_hw()?

-- 
Best Regards,
Wangao


