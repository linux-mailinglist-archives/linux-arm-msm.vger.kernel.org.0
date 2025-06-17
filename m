Return-Path: <linux-arm-msm+bounces-61600-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3185FADCC18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 14:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19E0E3B3F2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 12:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71E828C009;
	Tue, 17 Jun 2025 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mA7A/Uqw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEA420C03E
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 12:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165120; cv=none; b=BiGUGJEBUOtO4JE74jaSm5K3MRHkP4aUox7E+v/+C1l0Ew41sN1PabHbNqOmXqNTAktPxoszMfRJgLbpXZPZja5HzSgRVenA3cgRo/+qOKeaxrPionI9cPuX3biLYkYjXROrDHOjkCgO2AtGW+YjYzK9VL2NW2YdSpffRPjYaYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165120; c=relaxed/simple;
	bh=zINNnQKrwggK7kWTXCiCVdUpJ8Oalqzc3qWmQt5O+DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8SwNium86l+prRqIN39PFJwyymOkAFnNiTMDoCFbnYpEN4X0QqlXBl4G9IemmYQOS+EUOxECR27C3l+VpG8LwylYOk4zuYnelWUxScDoNpjUcPxEBgh5ynEptx91IyB+rikogXbBrIk0/fVNMxBYCBwM4+dnBJDXWImS3UdURA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mA7A/Uqw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H85U2s027542
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 12:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W0uz0+KKGBlzrS1/FOzkECp+
	49kWHHy2vJO6qOrGQG4=; b=mA7A/Uqw4WisaxNnnnuxlqWRNKsSoRapAFqB8vGU
	vgJLF1nMZAMHkBfy9zkKfY1nUjyaQbJLHNKcOpvj3i5Qj1+ZKKdzbCULfbRaO03E
	fyfNNSUymV21WP4hihwrIaDv4kfS0i3hM2z5Uzrvfxc6nfMoGRzkmlnjToUZJQXX
	uY090Pnnb/5YCT59cZrh1EGNID5Agzsl5IDKt6wLgGvoe2pijPyvYar6w+q3bXbv
	4hQrZvfNdjhJEXSs3/lgSKihvL95Ef8L88BetF9GymZ4JNEgHY1xEOpm21ThObcC
	DLfuw6dOF48u/BUqxVZMq7DGgkBAG6/pDJDZin+S9mujow==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd0dek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 12:58:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fafc5092daso122556386d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 05:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165117; x=1750769917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0uz0+KKGBlzrS1/FOzkECp+49kWHHy2vJO6qOrGQG4=;
        b=uaRFXz8aoGqOI6HaYGW7zsJvXhBaZOz8YkBX8unYf/Ob9tyXuxJbZsTQCZEql38Qb/
         ERGL/llu/g1S9BV21RCSqmZuWUDbvVojeOqk6VkjRg5NAB8M+tlHlspihm7mjELzRn5E
         a9SCFPIwVD9lC63CmEkIXv986e4EU6gEhRvxHrO2ByQU3EO8IDvRboTy0gMFMZ3qieBm
         w0rMLBUoqY+DuIiC2Z11h95LCL+9kKzoWC7u74xrdDgUTFuIcpX1XvucoY3vYvqhh5UG
         HBuESMFsBnbYU/ndBVkdlsY1tr8UxhgA0jsPKw6CCRG2nVTTn8mUPwbTIhxCq3A3l3Pb
         bvvg==
X-Forwarded-Encrypted: i=1; AJvYcCXFN48BBb+RWsxTvioFsjF/PH0FY5NcbBQ5mChS3TpxMFRDZwTddYNzQSBjfs0Dz5N/jKMQNd5SQwcZgksq@vger.kernel.org
X-Gm-Message-State: AOJu0YwbOnGZzKICYSeqMS08nWZiXcXBsUfA+WNI33Wc/ZCfXuAhi5QW
	4v+H8MYKBzvyfKOZQMV4NRDw93AZdIAxuOn30ElT6CZ41WFJ+mU8/rubAJBmVcg50ow0VVzi2Yr
	1B4e5L+lOHmz0IcdAG2P8o42dSC5I0mWE2viJZ7C+qCUe6tHqULAMtjea1KS462h69o2G
X-Gm-Gg: ASbGncuSoOKp2/hrj+/oBhxJkZJlFMnOeZz0VnspV2WtcAB5kmIyaB+OY2pXzF08X7/
	HpOk3T2e1hnbWF/12jmxpUaBaU78OO2FEDprg3hWwJVtDPFCFxnHunnAvb9MFaQv9CDWzKnJI4p
	mcV6ZjW6K+LuvZKNWI9moNYRZYU3G8FojYXOFvfUO0WxSVFAAMSt5pA/7SAgQ6bp2BY+zsZ2cpz
	LWPFD7J3U12xS+JSMeTN5QCYj/fnq2Ublz5PqIY9SmrlvFV7+pDq79dUP9WhwsImFFW8J9yUzhj
	p1jYZsx6xjCN2+IY0iclDhAcnxDV+zBzqK0zERR07D7jL9QdOG2d0zN55tYOdQrVLj4TnUachSk
	bczpiQfjK/9KotObjLpuQtEiD2wo/sSr09hA=
X-Received: by 2002:a05:6214:4f02:b0:6fa:9ca0:c67e with SMTP id 6a1803df08f44-6fb5e9d88d4mr41808316d6.5.1750165117306;
        Tue, 17 Jun 2025 05:58:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8gTs0Edzt9aosP4y7il4/VWAuaPvutV9CGNOzsElFxCXx34m2lMMz6XPGkFJaXuirGYya/Q==
X-Received: by 2002:a05:6214:4f02:b0:6fa:9ca0:c67e with SMTP id 6a1803df08f44-6fb5e9d88d4mr41807766d6.5.1750165116761;
        Tue, 17 Jun 2025 05:58:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ca1a79aasm278537e87.152.2025.06.17.05.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:58:35 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:58:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
Message-ID: <si3yx2f3isyxxqzlrrvwqcbnogqy42fiiipvrnyd326gpds5cd@chuo7ggmp6zq>
References: <20250612-qcs615-mm-cpu-dt-v3-v3-0-721d5db70342@quicinc.com>
 <20250612-qcs615-mm-cpu-dt-v3-v3-2-721d5db70342@quicinc.com>
 <ezlboeao2mqdbyxw6orzcqla3xthbo5ppuuhugwyxs5t4njvsd@qyy5r2ksmrj2>
 <89536376-6619-49a5-a267-b5a6b98940d8@oss.qualcomm.com>
 <8bceae03-33fe-4ec0-b1da-785af793dd86@quicinc.com>
 <928b8f33-b3bb-4831-b71c-756971ff7cca@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <928b8f33-b3bb-4831-b71c-756971ff7cca@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEwMyBTYWx0ZWRfXwDOsF5323X4Y
 uNrGzRPcLB+cFA5/25ke0V4jsCnIuwOVFWIh7GWWhYMO6AJZybJxJwFe8Q7dFVotIR/0v5XUlM4
 tXCM9nCeF2Mzrg/F6Ve1o6V4ExmElXoFa7gJqTQfYMdTS/XuuGYV/BRAT4OVoqviuTsu7SacUFF
 KJpuS2y4Gg3nKh9edfen87vniNR5wE4b00QA5N0VtNhHyyPBG52zZ7M/uOxQ7A1Y+IW9fyYU/p7
 2SM/HIDREwi0VuzWjmZl+lb0eY9YZKRhdMfF8WB0wxKybUZISp4cMjsZzCDrMalgvud96cMd/lo
 KvKR+JGJugF6nJRVKnMXmXrOjA2j4ySrUES7IX40GBIFS5bl9jl+ffuYndIInfAkbULYkjyLp/Q
 3dBpW+qM2oQz4DDhtW/gLBrX4cZoD81SGB5bWWx/4+VbCwqp7k5g/feroJry2h6EpDuXo5yO
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6851667e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=t7vRyMQEQ6ESp0mngWgA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: e7moqKYeMUP0tQag3GD27zqiH7kx9BcX
X-Proofpoint-GUID: e7moqKYeMUP0tQag3GD27zqiH7kx9BcX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170103

On Tue, Jun 17, 2025 at 02:09:32PM +0530, Taniya Das wrote:
> 
> 
> On 6/17/2025 12:59 PM, Imran Shaik wrote:
> > 
> > 
> > On 6/17/2025 12:27 PM, Taniya Das wrote:
> >>
> >>
> >> On 6/13/2025 6:40 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Jun 12, 2025 at 03:47:21PM +0530, Taniya Das wrote:
> >>>> Add cpufreq-hw node to support CPU frequency scaling.
> >>>>
> >>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
> >>>>  1 file changed, 29 insertions(+)
> >>>>
> >>>> +
> >>>> +		cpufreq_hw: cpufreq@18323000 {
> >>>> +			compatible = "qcom,sc7180-cpufreq-hw", qcom,cpufreq-hw";
> >>>
> >>> This wasn't build-tested (or was edited after being compile-tested).
> >>
> >> This is already tested on the QCS615.
> >>>
> > 
> > Seems there is a syntax issue, could you please check?
> >  
> > - compatible = "qcom,sc7180-cpufreq-hw", qcom,cpufreq-hw";
> > + compatible = "qcom,sc7180-cpufreq-hw", "qcom,cpufreq-hw";
> 
> Yeah, it was edited. Thanks, will fix it in the next patch.

Please don't hand-edit the patches before sending.


-- 
With best wishes
Dmitry

