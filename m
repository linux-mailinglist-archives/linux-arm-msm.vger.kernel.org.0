Return-Path: <linux-arm-msm+bounces-52478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDDEA706FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 17:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E040F188D6E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 16:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6C025D54A;
	Tue, 25 Mar 2025 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EqvdyqPa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F7E25A2D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 16:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742920295; cv=none; b=bopvlugN8BvKaZHX0fE3znc4luPKanvKyO4t740AJMNwkze0/LM4n1tyhzZOujLNi1epqJArAN6JXgQuP+ONgiWwp1WmyGlDeRogKc+a30AxXuOnPbu8cCqPf4SEs6NL3sC4rZXj9ImBUdwaGW2sHjvvUNjsA5EavJabAUz5Bgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742920295; c=relaxed/simple;
	bh=e6SbQ5AyChnoyji5yq1T4gAtN03kw2CXIfnvOT07c2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3d9F6ghuXaD+DSSrh9Qk458Z0Otu9FNTzLqjprMCoaSrT20dpvsj7B4sTQRrgQSHx2drGB8+OyODYSXD4S75KhkMB9AWK/ZtbGE24nSkcZO7XEaeZrgc3BMUwlTio6/y1/Fu7i9M0NwZS3vuEp9xuniPMt+X8mazBt+dQRtzOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EqvdyqPa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PGV9Ij002962
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 16:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8sLNzsN930MIaFYNWCrndVcJUG/GpmkS60UUQezFiW0=; b=EqvdyqPa0ep6kIdJ
	hNBhpaAB6vNG2iq7UufsB26FhGU0Lx+M1P/j0NxXZO/M4W8zgOjd9OTWdUUGwDu2
	U/ggeKLYsJQ82FVLq/aKlOCtuvq0IgTZ1uivfhdT0X35/UNK2KfFnDxMBvVVj+DB
	hYOtxrhHrkX7zttEoY+y+yV+iRA/Qqul4KKqPpcb7uu620KDr/jR6pK74WzlEmMU
	iKa/5TA1PKyGvQ5IKDpAuLJRnPG/9F5jt8eoiVzFagnjZU8r/yX/Wpkej5OsWmzI
	+2VhHzMqYOgeqC837ZsQNZhLnU09nk5jeDdXIcFsaIQnzr+ngFK36eNQyJV4x1Kt
	4pRkFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45k7qjc7r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 16:31:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54be4b03aso146657385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 09:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742920292; x=1743525092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8sLNzsN930MIaFYNWCrndVcJUG/GpmkS60UUQezFiW0=;
        b=HbCp86nou8QWFRvSAQjytFOx3iTC1+DHYTB7PC8N1B3LHpuTBVv1uTA5kHQWka+/lf
         o+BR0ZB3pzo/rMpj0HQg9N1lfL2JF7VEPxMulnqvH9OC6McuJekPchdXbaUb4CsGjno6
         Tron+xbRe0qt3dq1YFWQHDa10tbWn7FVTKzJUyLOyO0ZqZ8xfUyzJeq6xN//nPt6F5oI
         tfMzmTZuEyjypvyns1SlPrn6KPvKR9HL1gAXJXSPTU25tUib1QXxwytz6rmcwtQMRGTf
         7mLYT2rZa2ZaxsEAcZZIOGk02enusbsXJ2e/GdF1e6BUU6BYA9sdXpHqLoRa+cD4mcxV
         JLiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXl62CjEWPgoJ+381Iuw8drydvdn/5G9fXpfy78r3H6UGWP1NAC9TssC/4P8WWnb0850SYp+qUEe+31vszX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrxw/Ap7YhGj+wDyiz9Eu/vtuITkwfC4ey/p/KQtL5upn4TirA
	joDVFiSqvNa4LhHGrm5KLgOJMPXC5UcljiTV2kBdLcFsE9dYCgxVPSeexEne6QCkPuvfC3CRb3c
	7AGaIEltNTdfkW0W/dyOgcZBY6o9x6XCD3VU2HN3uLxwFQg+Kp1qXwzH5SwWhKjAL
X-Gm-Gg: ASbGncv0g+8/PVH6WuWgQwUAjfg1EiDKcEbbPkXjW1171DjIdlmM+khhcyzJUg5DsXs
	kpmyEwkFcg0hMuFImaTWbXoLWumxMot4DwGr1mH+E6fr03OyUrYrKQq7dztRzAXJnRCrfCLkogM
	9G2bxysgAou0JfPyft8Fc1JN60/UwrDnkf9trZVgjjI+G7UqW3VAIbQ3Im1lPauxdROAOwgHR1R
	pQdFYVMcLI6pAOHLOCLkgTAhYUW8xLPWm2VUIpTh+gnLfP7wQXYaP7Xap+nou/VdUW4LHO+QudJ
	NpS8mnu9qHTMgCgyvLjwh62Nb00agpP/E7Wg4l9LQcFALfoRTducOySlOhUceqbnW8JTyw==
X-Received: by 2002:a05:620a:294b:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7c5d9f7524dmr215370885a.5.1742920291534;
        Tue, 25 Mar 2025 09:31:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBp3BPLP2GGE9R3AphhXGm9rD8lWb6Y5ZCRaW6gr0oiptLbqaKMxd5nx0QUMpsS2fAwz3b/g==
X-Received: by 2002:a05:620a:294b:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7c5d9f7524dmr215368285a.5.1742920290934;
        Tue, 25 Mar 2025 09:31:30 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbd3d3esm877532966b.130.2025.03.25.09.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 09:31:30 -0700 (PDT)
Message-ID: <db0bbc62-ecf2-4f72-a0c9-462fbaadebc4@oss.qualcomm.com>
Date: Tue, 25 Mar 2025 17:31:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] Add snps,dis_u3_susphy_quirk for some QC targets
To: Prashanth K <prashanth.k@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250325123019.597976-1-prashanth.k@oss.qualcomm.com>
 <ee0848ea-7a06-4f4e-9115-5e3c0ab8bf95@oss.qualcomm.com>
 <7029a455-47be-475d-b429-98031d227653@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7029a455-47be-475d-b429-98031d227653@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QZdy_7srMBKTvT-AHugUITLJ0hpzJ10c
X-Proofpoint-GUID: QZdy_7srMBKTvT-AHugUITLJ0hpzJ10c
X-Authority-Analysis: v=2.4 cv=feOty1QF c=1 sm=1 tr=0 ts=67e2da65 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ZqfHA1wz_kCA0izwLYQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_07,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250116

On 3/25/25 4:01 PM, Prashanth K wrote:
> 
> 
> On 25-03-25 08:11 pm, Konrad Dybcio wrote:
>> On 3/25/25 1:30 PM, Prashanth K wrote:
>>> During device mode initialization on certain QC targets, before the
>>> runstop bit is set, sometimes it's observed that the GEVNTADR{LO/HI}
>>> register write fails. As a result, GEVTADDR registers are still 0x0.
>>> Upon setting runstop bit, DWC3 controller attempts to write the new
>>> events to address 0x0, causing an SMMU fault and system crash. More
>>> info about the crash at [1].
>>>
>>> This was initially observed on SM8450 and later reported on few
>>> other targets as well. As suggested by Qualcomm HW team, clearing
>>> the GUSB3PIPECTL.SUSPHY bit resolves the issue by preventing register
>>> write failures. Address this by setting the snps,dis_u3_susphy_quirk
>>> to keep the GUSB3PIPECTL.SUSPHY bit cleared. This change was tested
>>> on multiple targets (SM8350, SM8450 QCS615 etc.) for over an year
>>> and hasn't exhibited any side effects.
>>>
>>> [1]: https://lore.kernel.org/all/fa94cbc9-e637-ba9b-8ec8-67c6955eca98@quicinc.com/
>>>
>>> Prashanth K (3):
>>>   arm64: dts: qcom: sm8150: Add snps,dis_u3_susphy_quirk
>>>   arm64: dts: qcom: sm8350: Add snps,dis_u3_susphy_quirk
>>>   arm64: dts: qcom: sm8450: Add snps,dis_u3_susphy_quirk
>>>
>>> Pratham Pratap (2):
>>>   arm64: dts: qcom: qcs615: Add snps,dis_u3_susphy_quirk
>>>   arm64: dts: qcom: qdu1000: Add snps,dis_u3_susphy_quirk
>>
>> Are there more targets affected, from the list of the ones currently
>> supported upstream?
>>
>> Konrad
> 
> My initial plan was to add it for all the QC platforms, but wasn't
> confident enough about it. Because we have seen the issue only on these
> targets and hence tested only on these.

Okay, let's proceed with these and in the meantime please query internally
whether it could be applicable to others too

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

