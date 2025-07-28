Return-Path: <linux-arm-msm+bounces-66886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B80B13F44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 17:54:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A83F16C086
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 15:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5457A27280C;
	Mon, 28 Jul 2025 15:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7d4xhYI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD9426FA76
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753718061; cv=none; b=H/BOKXufADrkfg9L6s6wynjHRZVzvNk3Z1QLtki1c1vRxwF2Edt7gXnXDm3lfslCkkY7AfDxo/Cpqqb4xAZYCpmOCCzMen1l/oR5Pmp3FvCLI5DFU7Tu04OL9wjNBmjrGCp6OR6xKKd1k8sjr04BHVULcCXUfGTSKuu+g7wT4xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753718061; c=relaxed/simple;
	bh=ScWguQQyyMCsBqpCpd/Wm7swglUlJIJc4wip6J0ZYlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxrUz5OUtI82ky+fRrJmdPrjKxoXbvPv/lKuIyX7LRBgFCcBGjxtmSzFxghWHq6OT1melS28+ubZII8rW8n3HUL3LOEN8fqDRbaA7q9RIrRViFSfj3GflQofqJgDXTVixKMMKNS9r2D8HEKhUjtMHm1T4erkgZBbt3op6+FmctE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7d4xhYI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlc3G012425
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 15:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MjxEnfFY+QDN6dunr8E34pS1L0NN6GcefMiLtCN2Bak=; b=P7d4xhYIwyqECKWH
	ZJh2ezZWGyL7V2/cW7gwroGRK6soNCpaSN/j30HXtUs8kY+SrGeYjK+Y4z1b+u+T
	lLQR/lvqdJ0nc9BGZLRluYflMuxhWOYkT5Idtz0sa+/fJ7gsQS65hIntm8zDSoxp
	VCilKG2Mf4MANiJvJTsKwCEb7YAhA+1m54OFBrsWAj84QLKjzF3Vh98BOBPmr+b8
	oweVS7ZW5YUf1dHjJ5Mrxd9g4TXREPQ4B3SXwvbAEYavIBYHfjmdq0jyLZZ1GL2Y
	JLKIavjYz2jj8XGJ88n1xfkVTGHMS71JQmvqwW4A6n7weveyC+e6+pV6w5T7b4WD
	kkmCxg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qsk534d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 15:54:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31ed2a7d475so1386089a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 08:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753718058; x=1754322858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MjxEnfFY+QDN6dunr8E34pS1L0NN6GcefMiLtCN2Bak=;
        b=TGNF30ntUsvFaeSoGgdNlm/nd4H9xgfLQzESI5+udytZMsPwszFxgTaHt10FIeSrjL
         +//lVmtNW/PjU2H5ex3G5zzgs919KcnlzVwSAEPNgkisXyBikXUNYgWgKdOQx9ycxcLm
         9f9xNGLAagmvXfFqfXBgj6yA1me4t78BTSepXBlG1pbYgCpcVCprQcfAkpkjLGTJrHFV
         JwucMzEoV7GsQ1wfciN9RhJAJ78nEXKuiXeOqfLn/P2NkUNi+Ufa0bBkeks+ONa5GYml
         nT04OE3nNWl4FcLwyk6jtHpbs7vB3IJlpdcT09S4vBfGRVsatTxdaHU0iWDr74AthFYQ
         PxRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXFuo3yizc4IZ7SZNbeGQfIN6GImVef0gT0RChkole9+X0+EP2f2OT8AteIKBrE9DmXEezJxcMiZXgGBJ7@vger.kernel.org
X-Gm-Message-State: AOJu0YxmAyd2MH4/fsolJmeA7xLb4+sckVDafOLtlc5GpsgsZ8DePzJr
	XQ3fJhRyRWcYrS13At2l0OIL2G5AjOJ6GVbEkPUQu0OQ/omWYRwLy1rShOrnBTnOa3dtRWifUEE
	KY17D0Z68AZG8VKAgX9l83BQ7qPAQzggYVhcBDMUSdrLMiFhQQRbx8nk5+RwtByEb+nHo
X-Gm-Gg: ASbGncuaLQcoacy3adJlGgUlhy3Nrr+od/eak4W+Oy95DS2zSG3TlFGiBBy5nkU3sWG
	e8ID+NMiEyolYVV5Opq5B5Bqqg4RBy6bJk/ElCkt4zaSOZTJ71jdiYwlCSHaDZ+ho9p+goHJi9+
	ZN3wguCL7T9ESYuqFxIMGnoyR4hp1RxMUUe4O1jkZ54M3otemZBSroxMVhZI4lW6Lzxgr7WXkmF
	NIfq5VC6pZnA69yWhBOp+35CghYcjGExEDBH+LZrJfcoURu2N2dqm5QcstHmmY589vNhURZKE2B
	OLHkQu4T22zXPSZdo+DUi/uFg7XO6JLP3Q/X2A5DBbTSArDQtWEFQAqmASGDNRJnfVC6f5ERzNA
	E
X-Received: by 2002:a17:90b:134e:b0:311:9c9a:58ca with SMTP id 98e67ed59e1d1-31e7788a6aemr18357675a91.8.1753718058097;
        Mon, 28 Jul 2025 08:54:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeXZoAQdjpuChoZyAmT/dag8H3KC5MYBa1b5X4wsMiQZTkrmyQfj2y+wxmkWhpDYeZZkkpmg==
X-Received: by 2002:a17:90b:134e:b0:311:9c9a:58ca with SMTP id 98e67ed59e1d1-31e7788a6aemr18357625a91.8.1753718057573;
        Mon, 28 Jul 2025 08:54:17 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e835ad1b1sm6119694a91.41.2025.07.28.08.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 08:54:17 -0700 (PDT)
Message-ID: <1926e6e0-70a4-67fa-5e91-cd0155af1eac@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 21:24:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
 <b81aa592-a66b-457b-9f42-df4505b28508@kernel.org>
 <3gtlf5txxtioa5bvo6o467jupyoam4hjhm2mdiw5izv5vbl3tz@drndgp3tcrgo>
 <bcef34c3-98b4-454c-8138-c73729e17081@kernel.org>
 <5e2caeb7-360a-4590-a36f-ff1ec4c20d31@oss.qualcomm.com>
 <2a39c0ab-edd4-402c-95a0-a6286f03102a@kernel.org>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <2a39c0ab-edd4-402c-95a0-a6286f03102a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KdDSsRYD c=1 sm=1 tr=0 ts=68879d2b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=sFC1+cT0Mn4vjRNJ/HRkpQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=hszVpQ_PDtPmkvUSercA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: NrAO3tN7bKVllqpWeMEO68bhKgg1n6dL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDExNSBTYWx0ZWRfXx3vzfTaeFnol
 9p00aQ1yz2GmJyy3y3N59LcVUYm2cRmi9hy0A5lXO4L9Kajqqga78zRntCmhSFOuqzTGk9+pthF
 6XASKdwEzmlZwd6iSHb/aX1OzBoAg0U78eJYOlIdQx4q20p3xYgFWNQxU5d17W1PtTt3AQEW9xL
 5BfZS2NKLAL181G6GYxYeUpQbvf0DqC5WKbLr9G13ML4iHR6S1OVE9idPf6yrgB2SKEGSIOu7Y5
 topqkdS2Dy+Wanyw69JYGtjYoeYQJ2YxaaiNGbiMt2+xFMqwt9qXbDv89J61YmiVuB5KTd40gYl
 el1PgPBs6exATQ5h4RYkHGYtcA7icaC5n9gvAOG7E96ceY+/Ia2erYcrIxy7XdxOshXSEWmscFg
 BP+pXqA9sDY67Bn9SSqllRyUAVZV1/IS+gWONH8Db2RYf4v4HItaHqlsBIaD5bEflDBTSmox
X-Proofpoint-ORIG-GUID: NrAO3tN7bKVllqpWeMEO68bhKgg1n6dL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=808
 lowpriorityscore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280115



On 7/28/2025 5:53 PM, Krzysztof Kozlowski wrote:
> On 28/07/2025 14:03, Dmitry Baryshkov wrote:
>>>
>>>> and the reboot-mode is defined in the
>>>> previous patch. So, I'd assume, the path is defined.
>>>
>>> As I said, path is not. only psci/reboot-mode is.
>>
>> Do we have an _actual_ use case where PSCI node is not at at root node? 
> 
> Yes, many cases, because it belongs as well to firmware node.
> 
>> If not, it's obviously a deficiency of the schema. Could you please 
>> provide suggestions on how to describe that in DT schema?
> 
> I do not see deficiency. There is no ABI that psci must be root node, so
> there is no issue to fix there.
> 
> If you want to add such ABI, I will answer: no, don't, because we do not
> want paths or node names to be the ABI.
> 
> Compatible is the ABI.
Will define a compatible for psci->reboot-mode node and use it to find the
node. Hope its fine to define a compatible for reboot-mode which is defined
as a property inside psci?

thanks.
> 
> Best regards,
> Krzysztof

