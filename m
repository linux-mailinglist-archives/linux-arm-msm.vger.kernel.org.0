Return-Path: <linux-arm-msm+bounces-76365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5CFBC442D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 12:13:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63B5A400180
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 10:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B235464D;
	Wed,  8 Oct 2025 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkhYvz58"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D52F5311
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 10:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759918390; cv=none; b=avLGCHdg0BOoz5+aFdne7TbIOUnd821DgTeomRwSXF7ZA/XJ2MDc9jO2UVygRgagtqz+F5i7tqG36qr0Y5jYnTAiYbxHk2P5o4S4XyFzupLmMMZtNAXFYauTpm7EMzbxn+GWt6ryZ4cVM+AXNaevOnUdbH5k1JwKXTPYGL4Cgo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759918390; c=relaxed/simple;
	bh=OVFwk2vmkPRQ0Ilaya0kUAab//75n7hNZBd9EtiesrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iLOA5AGNAtfaiWyQPYwvJ0rdrN5qw5z3zFtsh+rH1k/i66LN6LQv0jD2xsE8ev9N0ZbUF+0kzfOu4fEKyKED0cCMne9ThImnoaw2vk0rognGEDbBx6+zzdFl7H5uw8rkxPognVcnaTN2z1gnWVwR5jtVS+EOo1zMihga3XbQ+nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkhYvz58; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890O0h022724
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 10:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0CYf3dNLaEZlzQyvHexxo2vllzKN1mgGFsi4zK0z0GU=; b=RkhYvz58cBtTIFbP
	qDur3A3MnHrpCzW588n38RLN/sMWoWWD1CkrRuGu7YsuX5CMiRHSJzb5G30hXUtH
	45ass38OYTbc2dQARVlbrbk1+IPWK+yhSgCSCd2x/AbIZIO5FagnjG80mpHyW9xH
	47LC/96MXsk26K0HisbFPzps6OhSUbshxZgwNCXlYvd+53AN7W81mlagsX1bw43T
	bHvkLqcjc+p+yeHMahxb7exeFHuDNuA2VzLQAvI+y3md9clddO6fIOW/BaYMFn28
	0z0BabVDn7agoneMESb8td+nz08CdL+2rktZxELa7rFVNIYqD9SI4nI5HzLvJzUk
	7DLcjw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49n4wkth7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 10:13:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-879fa4a2989so7500096d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 03:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759918386; x=1760523186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0CYf3dNLaEZlzQyvHexxo2vllzKN1mgGFsi4zK0z0GU=;
        b=Sg9GrRWUFB5TVMpYSKAGDAhpoXnwWXVnGQz/I/xXwLXSkc4KiONWhZYna0I2WPQY32
         c56Kl/JYezRGeK7BXP45WuDgDEwaSVRPknZyhVGNjQ1tNsgyswNiBDC+0WKspqD5Iw6S
         dGifeuhhf763TF32bplK9RfgJlSENPUVyBKAn0jNgrNOv6b/If9vRGYZ+AYO4JExy6iu
         +TOAEGpG5P5tZvnHPmNYVf1ZNTigOTNY/NvcgQN7PXdpV7f6mmL3xoIxEpW2LDLPJB7K
         yndsaSyPfb6T56bwCxy1CdP3RkGg6yLTCZv4BiCBo8MaoY/Epqi7hVj7fdAuf4cxaPrE
         MMgw==
X-Forwarded-Encrypted: i=1; AJvYcCV35ZL+LiuqyBuT2dTrqmZU4Fpkqlzixm+v+16GhTPNl9Vb2V4pLTCHXNFYAA4F9G2mmP3O2GK2AWhCyyzN@vger.kernel.org
X-Gm-Message-State: AOJu0YzNfH1jQiFxBjm+/M0OKbzYP5rOOXzybIPUmuaBx1AVcxn9AEwC
	JpcHaR1JzfLv8L9zFKE7CN29APphx0jE1Km5pPD44lIAJGHishFTcJ3xU7dubS/pKX9/W8ji5Zt
	YV408SI4/yFd9YE8VQQ0sEVDflLvehBxnG3KqNYG5HLQ9S2HX50shrb2QwQVHhp6yZ0eO
X-Gm-Gg: ASbGnct8mVgtybofle+vrcmQZW8uF3Mspga8Sescv4JFnbek/ZOOEyBPvyDrNCGFg+G
	lnJBdmwcKGbMj1EWyCanr4QgjnuX6mjnAkB+pZEyYA6gROeJdL9GZAY4dRP6+Liv8+Y4Tlp7Shw
	CEI5wK0qdfOxCFlLmcOfkPy53w7mm6Uen3uTBB2L5j6236kZnmFJWOaOtrLJRKUuWQvpvbAZihq
	wqV3IjfoMH+M0VMRnhFsc/iHtk8GZ7bWYEZg5CZZmwn/85r1UA6I+qqXPkXq8ahCV4qsNQSQF1k
	C6rpwsHnYte39aq7ni/IC9gmuRosmv5m+/aC40OBVhWvH15wiFxjyY6KAg7dVYdmpVa7d85IAz2
	71JzS2ETUpqfHw5yPhsJmuj0SbAw=
X-Received: by 2002:a05:6214:2308:b0:726:8d13:da3c with SMTP id 6a1803df08f44-87b2ef7a2c9mr21194566d6.5.1759918386402;
        Wed, 08 Oct 2025 03:13:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJQ5SbDlFjHkzkYiLRMPLYeHCN5y8MqVtmXRwjDsCj2I0UO6+kzqCdfxaFElAOm5iqSOd3Vg==
X-Received: by 2002:a05:6214:2308:b0:726:8d13:da3c with SMTP id 6a1803df08f44-87b2ef7a2c9mr21194236d6.5.1759918385707;
        Wed, 08 Oct 2025 03:13:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-637881000e8sm14492232a12.32.2025.10.08.03.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:13:05 -0700 (PDT)
Message-ID: <5408daec-127a-4fdd-88f1-855c90694f6a@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:13:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: Add EL2 overlay for Lemans
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-12-de841623af3c@oss.qualcomm.com>
 <yef5jtmcfuks2w2sngxr4a4htihxx4xidsgwpro6wckbfvmvvn@jfr3dlsdf5vm>
 <20251008073214.kcanrljguox2vtzq@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251008073214.kcanrljguox2vtzq@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDExNyBTYWx0ZWRfX6Xgv69QGkau8
 69TRuMdNHYuSdo6APJmAXzYlVv7Ia0ek4e4gbva+5sltwYGoZnq9/JRtN/+kTtd8XWiW/ltxe3O
 zZTJwhiSszUtBxqjG8YJbkSTTg0KdIdBhDHM/+o7dMFvf9t7rYYM0WtuHSSXO2EJjhcvbM9DTmW
 lYmPM6m9V56yl+yQXRj1/Sfly1n0YRNFJuqNfzaTuP443c1GIExgOo7mKhvcT6Xo2nXAWbcPUUt
 bGiwp2/tovuaBqvWTiEsrddUWMoEYoZuPZtKmFtqs/epvbMAOyWqpEhNUZGFz1chG2Dh//7DrbP
 IyCgqZ7sUo2Xk+rNb10jDyDjcM5vkAmw/TncXWhsF0lNFiLP4s4W3BGPkHkQoXwJtfsBqX8uyIX
 bvcCv0JcjH7oa/hqEvd8BFwi+17DlQ==
X-Authority-Analysis: v=2.4 cv=BP2+bVQG c=1 sm=1 tr=0 ts=68e63933 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EtbNqAIpQJKYYPU4GdQA:9 a=QEXdDO2ut3YA:10
 a=eSe6kog-UzkA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WiVnFibGqgtfi9bJ3Hbm38anWSCf5ys8
X-Proofpoint-ORIG-GUID: WiVnFibGqgtfi9bJ3Hbm38anWSCf5ys8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510070117

On 10/8/25 9:32 AM, Mukesh Ojha wrote:
> On Tue, Oct 07, 2025 at 02:55:04PM -0700, Manivannan Sadhasivam wrote:
>> On Tue, Oct 07, 2025 at 10:18:57PM +0530, Mukesh Ojha wrote:
>>> All the Lemans IOT variants boards are using Gunyah hypervisor which
>>> means that, so far, Linux-based OS could only boot in EL1 on those
>>> devices.  However, it is possible for us to boot Linux at EL2 on these
>>> devices [1].
>>>
>>> When running under Gunyah, remote processor firmware IOMMU streams is
>>> controlled by the Gunyah however when Linux take ownership of it in EL2,
>>> It need to configure it properly to use remote processor.
>>>
>>> Add a EL2-specific DT overlay and apply it to Lemans IOT variant
>>> devices to create -el2.dtb for each of them alongside "normal" dtb.
>>>
>>> [1]
>>> https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
>>>
>>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>> ---

[...]

>>> +&iris {
>>> +	/* TODO: Add video-firmware iommus to start IRIS from EL2 */
>>
>> So the missing 'iommus' property is the only blocker to enable IRIS?
> 
> Yes, but this would require some changes in the driver as well to create
> a platform device for the firmware and IOMMU domain, and to attach the
> firmware device to the domain.

"yes, but actually no"

> 
> There was some discussion around this in v2[1], where I added support
> for video. However, the change involved hooking into the video-firmware
> property, which was used for Venus.  There were concerns[2] about following
> the same approach for Iris, and due to that, we have dropped video
> support for now.  However, an RFC has been posted from our side to
> handle such scenarios[3], as of now unclear about the direction for
> Iris.
> 
> 
> [1] https://lore.kernel.org/lkml/aKooCFoV3ZYwOMRx@linaro.org/
> 
> [2] https://lore.kernel.org/lkml/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
> 
> [3] https://lore.kernel.org/all/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/
> 
> [4] https://lore.kernel.org/lkml/4a32bbec-2baf-4210-a7c1-1ddcd45d30c8@oss.qualcomm.com/

Reword the comment to "/* More driver work is needed */" since there
is nothing more you can do at the moment and you most likely don't
want to block your series on resolving the above entanglement

Konrad

