Return-Path: <linux-arm-msm+bounces-75524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB69BAAF69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 04:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10D97189B3B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Sep 2025 02:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF903214A8B;
	Tue, 30 Sep 2025 02:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxxpvqUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B5720E334
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 02:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759198464; cv=none; b=I1WioLxhtQoxlQoOqW8gyjTmWGbec1QxvV/RctC/+htTEqgDm3v2mFNWSB+ien3H/rRt7TNi0gCtjXnsY1w/93ouZnUMLsd0Wr7RxCWylfomLifNswadJBenfuDEsdo9fmszbiLs4II/E8w99ucndnCEoKnvdf8epPPAUYq11NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759198464; c=relaxed/simple;
	bh=7uvs9seTMoFJ8Zn+T4ada7u77i+jtQyOgG5K25z89c0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fKT/xVXYM9XklpzmvIzv+BBg6tFFWrioHkj/s2jsag1C22rfdMFCQBnCScl+x+pNoce4pDxpcpNVLbFdYbeaWdMnvxJcFSUpgEEKtskfuz5kwNnezm1NNZW6gbXIgeAVeftzxRTYpJMqpb9SPKvMuzTTfrO8oluG98PwyNhjK9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxxpvqUz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58THZsvY007658
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 02:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0axRjvcMTtr61lesxlwkt6CZWhP8UnUm1b/fxV1JwM0=; b=YxxpvqUz3MFEA0SY
	LFhUzuFXOreuqEuNnX4zfwrZ1jDd4tzXlpGuO64rKaP3uayvz1QYXBtsewY8Kx+K
	ij0HnAMOhZMGnDG9TxovBS/D1A9LWFMT3+CnpNaRomkYTE051p2h8+KafQE0aYHe
	vJMgYe2y9IRn678sM8gV1/Qz6eNbw4VOoTKn96wvJfFIdm1A06LjhOgo8fBIFgh3
	AAK8Vbjo9TS+bonXULzk78hlI9mbDNkxDl8aAZVA8lqJAFBcT8XhEKybDTMCzgVM
	I1eF3Uy0dwybvi0RIVGj16yTrDAM0VqjFCL9GvL4iIa35/TN0dA/UizpxSXQRppz
	7PnPRQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tqder-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Sep 2025 02:14:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eddb7bad7so1463109a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 19:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759198460; x=1759803260;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0axRjvcMTtr61lesxlwkt6CZWhP8UnUm1b/fxV1JwM0=;
        b=Wrw03jScTth/qkPCg3BO3Z/CbuGDmIfr7Mb3sx+3XVcxhgjK592gCq3I9n1mI8T+25
         ea8QClQ+asdeM7ctjVjSbsmrQD6jHltVMh7nfetXRmWEuNzS+mNo/aOUo0rWw/0xsoYc
         FFgXiDMbLbwKyGTJLCL+XqOKIJsVlQ6oeT7u+2w4/pD+02ZX98Ht4N9Ae27l1UMIcpli
         mSGosK+j589MORe/rXsl/Ta2CRa/hTuK2mXwxqKfEE1Hq1jf+IsTc6w8xzJgBgq2U1kV
         SerRWo5iYIMdJKQ22/mC43ALfnoiQQ8md7k3rAOsyQMQUyVIyOp1Bb3+xXLONgPEHim0
         27AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlNkDSWVaECkajr49O2FAvcyyL5GgP7uoPX4aNbhUTgxQV3Wc3ss7OuSXDd6AQGEcrAItBZM2C6sMNUWSV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0KMdsTN4uw6JASW/4lUpHOIDaWuXbobBaVi0TYynnb5RVKDfd
	rAlZVFirvvBocJzkFCSyo3z8WrXJloASzB9J9a8Ac1Nxcz3fts5fDEYu55AmoriH01OW8CsXrI2
	jo1BrsvIJ0GML2XWPJrV+3RNSCPIpQd4Z7kPwfyZ/EuC3kSCgVJ5mxekhwJ3JXEuB6819
X-Gm-Gg: ASbGnctm06ulkBieJ05rQsYojex8/uwretIM4Eg+PFSak3pge+q4fBq5DKqA56QkPe0
	1Oe1jcJFnCmiEMRcbtLgyErUEaaDeZif/FmAoVQk7zw44a1ib6cwQiS83Kb8HCaTusfs8R/+UPZ
	kD6tyTiLfKD/IsmIE4osGNLL6z/8NdSu4DM/pd/otO5aQkSMhXOAxbmN3cfFKVDRvJC1QnBwk32
	s4iG23zuaz7I/LOg+Gq3hLRRgqBYREjhQHM+Qb38FvZBFrp0f+2iWgUREaWtmSpU7upfWt30heo
	Mt4RlOUNNGxRmG0YdFQtNKIGoFlLXUzdEB28inA1RKNs5AJ8Uym2k+8MMWqdXQYrCDozr42mJBJ
	2qw+fFlretXbbl9PiztGMEeIokx/Rm5qvi/Si
X-Received: by 2002:a05:6a21:6d86:b0:2e6:b58a:ddf1 with SMTP id adf61e73a8af0-2e7ad646203mr13115977637.0.1759198460487;
        Mon, 29 Sep 2025 19:14:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQAguvzHmwUnb+rdbg2sxOcIH3ETIs9YUrlln8TWk77WZpIDKL35m8HuriOIJ/sZKAzh41vA==
X-Received: by 2002:a05:6a21:6d86:b0:2e6:b58a:ddf1 with SMTP id adf61e73a8af0-2e7ad646203mr13115955637.0.1759198459919;
        Mon, 29 Sep 2025 19:14:19 -0700 (PDT)
Received: from [10.133.33.226] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53db8d2sm12386755a12.24.2025.09.29.19.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 19:14:19 -0700 (PDT)
Message-ID: <7d8eb4fc-aeb2-48e3-942d-8aa2cb3aef6e@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 10:14:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/20] arm64: dts: qcom: kaanapali: Add QUPv3
 configuration for serial engines
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
References: <20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com>
 <20250924-knp-dts-v1-13-3fdbc4b9e1b1@oss.qualcomm.com>
 <9685e29d-bff3-4188-b878-230d0f161ce3@oss.qualcomm.com>
 <5410dc83-0732-4b25-ba07-605e4956d840@oss.qualcomm.com>
 <20250929-notorious-masterful-cassowary-e26114@lemur>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250929-notorious-masterful-cassowary-e26114@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX3cjKf0aALE9S
 OK/UdhDpxRNO4FHP6vjj0TnJ8UnWrdsOAnpL4DGHBETzXn4EVr3pSG+rg37cYffP6HH/3eiAfs4
 PWJoqRp9Vur4KQQKAZ0xhQAKg68s0VCd0OT0vscH+/zK3LXhcHJjsppICa1dUhXZLj5auBCDHX9
 gIcOHe02iVsbgWATv0tbI9MXRpc1Ew2fYoVe4B0Bomohlh4aICZzivfOmKPSeT3IrSBJ8n7Omv8
 ghrN8h7+qNww42esnlpGUNa5dG/aHkomALP9lrmMqVL01+rOP3GzRavCmvAcVd8rCjqsj9gdCFM
 LReM8DtH5jZqIa6iXKUv9tCcDtVyrbn2PTTXZzWz+8IyCZaBpZ9iJ/po/fIYOgvyLXB46l8y/IQ
 lbWHLep0nSbMJAZbyUQCmIR0lIPRqw==
X-Proofpoint-GUID: tIw9_5GNeDhKmChq8QStKDeG826U1RWV
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68db3cfd cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=3TF44CuUNLJTpavCzZ4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: tIw9_5GNeDhKmChq8QStKDeG826U1RWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_08,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

On 9/29/2025 9:11 PM, Konstantin Ryabitsev wrote:
> On Mon, Sep 29, 2025 at 02:41:27PM +0800, Aiqun(Maria) Yu wrote:
>> We’ve tried using git format-patch --patience, and it did help avoid the
>> deletion lines issue. However, when we send out patches using the B4
>> tool, the formatting still defaults to the standard behavior.
>> The challenge now is: how can we integrate the functionality of git
>> format-patch --patience into the B4 workflow?
>> Any ideas?>
> 
> You can set this in your .git/config:
> 
>     [diff]
>     algorithm = patience
> 


Nice help, Thank you Konstantin!> -K


-- 
Thx and BRs,
Aiqun(Maria) Yu

