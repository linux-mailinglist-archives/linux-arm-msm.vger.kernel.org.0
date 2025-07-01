Return-Path: <linux-arm-msm+bounces-63288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 151A5AF04B3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 22:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 327561C0751C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 20:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E49A2ED87C;
	Tue,  1 Jul 2025 20:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVj8XoI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA7C2E8E11
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401295; cv=none; b=CGJskbPV/nGMgYEjJZUNagwrTMa4d1IbWlhzdYspJK1JM2EzW5/vKEXdZPlRBxYUNgxkBfwPATcD7JnKhSxkV8LhAuYVZvcmwGkTxchIqNh/7V5ZkV08g+3rTLY94nAnyywFsg9Exu/gvAwHYdx9bfojqqqBkFL6lmlJVyKWK3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401295; c=relaxed/simple;
	bh=ezE2n18Omi/MOjX73Sr3/tMK4T9hA/BPKdf80o00DBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PE6Ofjr9anDUElKqLDc8WVJSIIahnsw58GGAtBfANJJ0VJF2Qj12LtgGy86AYBLZihCAxVWEqTBIHNFrON1xDwrUoFkzNaAQGyU+2W63+ODKW0jH4n7vuHXljwckcZbkyJxuTE05+p/NxEit3uTBSMQ0NUr2866bII0CjNEN3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVj8XoI0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561GoWkp018563
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 20:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUrytFkRXZ1kyGSNxdZDA+tX90rrT6JMS9+T22SMUsA=; b=PVj8XoI0Q3y0tW87
	zA5GLcA1bosb3F1naOB2mSl0UkwnoWIOAH7oWo0b5ZWFYIGH9fFhRbF4coGGhrYj
	TBSEIL/vR08M/xu5zEHP+KsCYHeCYEUkyq6uPvMM76SEcYDH9PZVOCxthegb+qEl
	sYHDi31K3jfsRvmc1Os4H+9O4EW6BKJOZ2/cKlr5G99nyW6r9bZOrmMgg0j1MRyB
	kNDh94BaD/jXg1qymIaTPuShELus0ZjdIeabw56bIFTJlvb07n0Ju0aKL9LyiXZU
	RjvyBlud113UDjsCzqn0pWbArd4lB0lCyx6tl0xHqntF6e9TWKeGZvzBpjWAHNQ/
	mtmVWA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxj989-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 20:21:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-237e6963f70so89474095ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 13:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751401292; x=1752006092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hUrytFkRXZ1kyGSNxdZDA+tX90rrT6JMS9+T22SMUsA=;
        b=NwVowmVRDBz2F92zZhwR4KJcxM+QitWncRzF6AqeyYFxOL9gMCUIyRetO7BGRKt/Ix
         /SIQqzKd1OPe3UK9sewMT6IciVKtepUT+20vsfdbRvB9LBarovhE9kVWa7PLuTSXUApe
         AOh+O3BJcGX90+hhmGXVi3/1XggaGGBVY5uCe3FJF/zbfG2Syd+AWa+pQw1snenz206+
         1zJtYIMYv1XuGWU3yLAGqDN34Qwdd82v9WLRpp0iFma0Obc96sH2MxVUQoW7nOZBRR2w
         5mR7jqvV49lidZJr/Kvoo45/ejlo88BaS+t/dXp9W69xp2bCpegXbVXvxJbAoJMaOyI0
         oN8A==
X-Forwarded-Encrypted: i=1; AJvYcCV/AnVUUJERwhvLjYpVGq2hL7TEcNwjnp7KH5Jkrw+UTqMFsaf6poKoim2cMwEHWIXLk5sQVPJRLVjqK6wt@vger.kernel.org
X-Gm-Message-State: AOJu0YxAGW6F8A4bmsFoJHOnQlfQliabOGVxTpwkhvSCYAFnWHR7RPUG
	jgtU2PZ7kp0r2Rr74JOHebc8RHnt+Hok6q0cyzdx35qT2Fps3yANq5nc23KsVMYjRsWlYSFANxr
	DivPPhN49XG2P6Cmh4XPhrpU32me/OexQ08VzIEjXg4h7mLhV+33qEtuCZsnsaMYe0HoJTJRhT8
	3z
X-Gm-Gg: ASbGncvSdd/HZKmZo/zACC2DF+6mzZ/fvuXpe+5VBCdadJNH2lx4oS1TXldqcQ+NLuK
	Hco+2gF/uSmuLTGTMZqYiupwQXkAI1nWGMYmkN52vCuvEpWlxhtszDMhQaWX5ddPUtw7Zl55shO
	RTWQmMKeD3QIirgB7163AOUc8HUK2Dks8piGkEyd0hYoPWahzAhoM19Yxzu3oGtBSA1v73c1eGI
	wZ1cPmow1mtToTce0B38jAg4Ra9Tq0oj8ol2p7Cu+YLa1xHMi38nizD5WOBi0qc6pZWxsSQ+L1t
	P98O7naUyQIkuIR6OqDVk6CWIL4LNjwvtLvmSWrvNB8DB3J6B43qGJLSOaw+xPid
X-Received: by 2002:a17:902:ea0e:b0:236:363e:55d with SMTP id d9443c01a7336-23c6e591826mr752465ad.28.1751401291816;
        Tue, 01 Jul 2025 13:21:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq2/qAA6kM0CeuXpCcxP+BXUf/kabRYb4GipX6TGcMwNAVDXbJ8LpM3G58LJeO9rQYMHePRA==
X-Received: by 2002:a17:902:ea0e:b0:236:363e:55d with SMTP id d9443c01a7336-23c6e591826mr752165ad.28.1751401291387;
        Tue, 01 Jul 2025 13:21:31 -0700 (PDT)
Received: from [10.73.112.69] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm118879695ad.80.2025.07.01.13.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 13:21:30 -0700 (PDT)
Message-ID: <89ded76a-8bd7-43b5-932d-f139f4154320@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 13:21:29 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] dt-bindings: PCI: qcom,pcie-sa8255p: Document ECAM
 compliant PCIe root complex
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, will@kernel.org, lpieralisi@kernel.org,
        kw@linux.com, robh@kernel.org, bhelgaas@google.com,
        andersson@kernel.org, mani@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_ramkri@quicinc.com, quic_shazhuss@quicinc.com,
        quic_msarkar@quicinc.com, quic_nitegupt@quicinc.com
References: <20250701165257.GA1839070@bhelgaas>
Content-Language: en-US
From: Mayank Rana <mayank.rana@oss.qualcomm.com>
In-Reply-To: <20250701165257.GA1839070@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDE0MiBTYWx0ZWRfX6ZcIe53h5OC1
 XfqsF2/pSAdnMB0H1r2PPqa0v3a9Lc4rcN3txlHmp1YblAuwdN8WDwYu0IL38rvPsJwf3Pth8NV
 ZWGxigqkBtSt848yEzcKWehMQyBadKLhorVD3okajPH4ItYcFLQmkX0C0jH3K1PfiJcaDEDpKim
 v+tNjuaR/WeSmkO+2PsMac55yJT5Y+1vLnquhAHL4Ak6qA8oPCgWYgZ2FMr7oWEwADYInUreZRA
 x/ZaP/5PvMHcN1Y6JAkSXPgwtcX3FsoBFt3JprugC5WRlbF9cjyxZUDL4TgPSkd5xBnL75qvO92
 w4oWyNcLkYSsg9gYKbckBDSPj43I24UTGc6dkq0cuwpio31+1O7c9ucDoBYhjAsFlAhMFPNMxBO
 g8igsbhyR27OOmc4Vy0x8vng3IjRyn0TekAMrOHkiEeGh8n1IM/eL27oCAZajL2/wvSQxgFD
X-Proofpoint-GUID: 3oDOwdzJivHk-I1tjdRNRRO_yYxPa-eS
X-Proofpoint-ORIG-GUID: 3oDOwdzJivHk-I1tjdRNRRO_yYxPa-eS
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6864434d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=99n8J7Ytk5hhnKoTW6cA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010142

Hi Bjorn

On 7/1/2025 9:52 AM, Bjorn Helgaas wrote:
> On Mon, Jun 16, 2025 at 03:42:58PM -0700, Mayank Rana wrote:
>> Document the required configuration to enable the PCIe root complex on
>> SA8255p, which is managed by firmware using power-domain based handling
>> and configured as ECAM compliant.
> 
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        pci@1c00000 {
>> +           compatible = "qcom,pcie-sa8255p";
>> +           reg = <0x4 0x00000000 0 0x10000000>;
>> +           device_type = "pci";
>> +           #address-cells = <3>;
>> +           #size-cells = <2>;
>> +           ranges = <0x02000000 0x0 0x40100000 0x0 0x40100000 0x0 0x1ff00000>,
>> +                    <0x43000000 0x4 0x10100000 0x4 0x10100000 0x0 0x40000000>;
>> +           bus-range = <0x00 0xff>;
>> +           dma-coherent;
>> +           linux,pci-domain = <0>;
>> ...
> 
>> +           pcie@0 {
>> +                   device_type = "pci";
>> +                   reg = <0x0 0x0 0x0 0x0 0x0>;
>> +                   bus-range = <0x01 0xff>;
> 
> This is a Root Port, right?  Why do we need bus-range here?  I assume
> that even without this, the PCI core can detect and manage the bus
> range using PCI_SECONDARY_BUS and PCI_SUBORDINATE_BUS.
On Qualcomm SOCs, root complex based root host bridge is connected to 
single PCIe bridge
with single root port. I have added bus-range based on discussion on 
this thread https://lore.kernel.org/all/20240321-pcie-qcom-bridge-dts-
2-0-1eb790c53e43@linaro.org/
 >> +                   #address-cells = <3>;>> + 
#size-cells = <2>;
>> +                   ranges;
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.25.1
>>
Regards,
Mayank



