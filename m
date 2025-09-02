Return-Path: <linux-arm-msm+bounces-71522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB21B3F9F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E80A41887971
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 09:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07AD2E9733;
	Tue,  2 Sep 2025 09:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqJ89l/X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360DB2580CF
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756804493; cv=none; b=MdA0j8FucGuMOOeY4Q4RL/R/OJy3eE2STPDotJLIfAccNt7Rw932hbPLMimz0FiX0aR0gzAvStR2aYJ4EVJwCFntxKvnpWW/h9il+enArp8lE+6+Kf4cyIMiPzEBbRCGSH3DLQQ/byNEWmDpesPdJPRs4W9c2nc3fNHFS4Hf2ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756804493; c=relaxed/simple;
	bh=Sv5rjcMW0XRL3T4QTlzK6bGt+YKcn27Pk+A4Io6DRG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RyN9/ZSWZvTIAJuD1aZ3v2C+SnbWLuAPkGIiCYKVL4HUUzXECwEsDlF0dsrlKsCFxckS3SHTNu1MbuZJBFJIfqNvbrRlKohQznD2khfPzHewhga//Uy24YElRVa5gWcFX+HUKtmIB6UyfeTTb5NTEPc5ta603r9U8SUXH8PHCb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqJ89l/X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S4ec030589
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 09:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JO1ghtzbf6msdOeC9Wq7UpFQnYphPOPa6N9e0whQQw4=; b=lqJ89l/XL7eohyXm
	B8/rx5P7wR+PqB9DzMZasnXgDSPmlEoK0i6/51pgt12C+LHKoT0bJF/KkQyXl9U5
	/j3cmOREMAt54FT0DhrgbglP+buY+m6sudUohFCofhElnTMcSRVAvRFXIVmEHoWh
	MVQVFJSCboTZr8znRg0t9C7Ey52df/8ukG8fFVbYGBts2SpLHlxo9yMaT5ufsWsK
	gj9vNI3vMtbR0GZ/ExiSL2nmQ5bgBHeT/Ar25Y0+CQIvigpZuC2KmD5cCgMugjr6
	7QdNBXVkGEubRGSogx2YmIHaqTnk8m09pdDdlL6QtWXrEoXbfhxNe4mzDq2XJjvD
	sn72Nw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8q79q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:14:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b307e1bef2so13932921cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 02:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756804490; x=1757409290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JO1ghtzbf6msdOeC9Wq7UpFQnYphPOPa6N9e0whQQw4=;
        b=DixPhQ8pcq32K6E3mqKnolmB1/73PCTB7hfta+IPXRi2qYIKtgDiJXogV/lL1dIkaM
         i2+kUF+iTuKdlSESDgGoa4q8/W8RCFoRnSnMQCrFk4u5MG+Hxf+jOwR7zUSm4N6IkruJ
         cgu6M1TTSIWg1Ae4Gt0Zux5uTVK/VFeIgGdPozYfhD1Ir/djqwu9scLeK5HDqwk/V/FF
         bFHyYJfqCtx76+t7XTcqlaBYhYJg28cHMbvp+h8KmPESxJJbkAsu+1oDvCOBwouYVBQV
         iA52W8hrsCeeAO4r94csYi/PP2ijuxVLJOE8/idRwuluNUpnahzag6OFlJzdQkamkOKr
         CJYw==
X-Forwarded-Encrypted: i=1; AJvYcCVyxW36397rRejFuVSsS0yuReCGjXgpnQaCyXIURFVPyr0y3m/8RG15TMNqnb7OKAxYXL3/+rylFa5FUE4Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzdCiRQ3jxKpZlnxrSxqQXoWdiQwS1Z8GFINAUEqjcnUxAD0Kgz
	PaXpZQKE3SPFJfVtyw8IFQ1nXiQBpkZx0Sfq+CrENCY4Ml33sRBd0ejJBHii0j5S2jqTz9pLFMn
	Mr+zd0PDNzJs4j9298Ta4RXtEs/9mwDhAaxZCUhqiLxDLNFykYdeouc3RMM96OF9TAcSS
X-Gm-Gg: ASbGncuZD5xbPdtcaaPtL1zYIpG6iHB13A0Ehh95HNSTAmdEmdef6Or0G4u7YHfmPay
	0kkwPzr2iJTpKNNdXGOKl9enErfE769o6Uy9UKnOXQKgwqy2t+mwvkdWDrh5r05+ers1gX34LUG
	QN1o5pIU1zPIKiTOmPXH5CEyy+JkBVZIGaqcVnOORMFqR8O/MtCVTJNfkg1KS16sZklj11C1b7z
	vNOQEVEzbsbdysbTRdt5IKByZshm0VwodRK0mmM+j2yZ+EG1pv7FgbxW7SVBX8pVtEP6KlHideN
	XhjSNifx1n4T68leEjU6J6AQtlFCBtX8LTqnFZVI7u0sCZloK+d37PE84KOo6RTxVKHj+lGgxB2
	lyLnXS/kKLOloxf3OatVnZA==
X-Received: by 2002:a05:6214:5083:b0:70d:dcc0:75e with SMTP id 6a1803df08f44-70fa1e3755cmr93720476d6.4.1756804490097;
        Tue, 02 Sep 2025 02:14:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdxjzG5x24toM7rERz1x8tefpoUw5nxnJ08BKoZmfBLD2lh1HYnUpQ1tPf3aK4LYj/wz/d7A==
X-Received: by 2002:a05:6214:5083:b0:70d:dcc0:75e with SMTP id 6a1803df08f44-70fa1e3755cmr93720336d6.4.1756804489632;
        Tue, 02 Sep 2025 02:14:49 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61ec8516621sm192683a12.26.2025.09.02.02.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 02:14:49 -0700 (PDT)
Message-ID: <16698a59-1a2f-4816-98fe-56b125be669b@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 11:14:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] bus: mhi: host: Update the Time sync logic to read 64
 bit register value
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        taniya.das@oss.qualcomm.com, imran.shaik@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com
References: <20250818-tsc_time_sync-v1-0-2747710693ba@oss.qualcomm.com>
 <20250818-tsc_time_sync-v1-4-2747710693ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250818-tsc_time_sync-v1-4-2747710693ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q2KhSOAsCFfyJW0OtYCXwa87Cz7bLZUr
X-Proofpoint-GUID: Q2KhSOAsCFfyJW0OtYCXwa87Cz7bLZUr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXwHibfX6/cN1g
 BWzVL/2EVoTJyDxu+HRWjxp6qc/9mMK6b4P7/H6Vu+MumjIF+kT7fcL34zVHQKL9V1rH6l/zmVG
 ERu3xLIRrLdmLD6eBEUta32dfX3LvLt1wqXyZLCGtKYVPTBSNYIxB9wrIINvJEOkd2tcsf87b3v
 Di06kDCNJSpg/i9vwJD5d4NIgFb7QAysY+VW24c87DiOWOr0M/ONDHOlTt3uHz+bgL0OZMTayyE
 glBe6waulgD4H/eTCDjNFIqf1bubGyCH1Sa1KUn/eTcETxRDAL19/74uD0vcU9Qig0VrvLkoxnu
 z17DAyqYtPN0Xvl70eHyQSt7GJx/rRzBQSzsnkx/cpwr6T0avAM81O54477yaV9Wl8DREkRZ0mF
 EZy/D/eL
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b6b58a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=YtfURPx0HkL0cCzLSeoA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On 8/18/25 8:55 AM, Krishna Chaitanya Chundru wrote:
> Instead of reading low and high of the mhi registers twice use 64 bit
> register value to avoid any time penality.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/main.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index b7ceeb7261b708d46572d1f68dc277b6e1186b6e..f628198218ef9dc760bbfc3ec496603d1a45dfc1 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1719,6 +1719,7 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
>  			       struct mhi_timesync_info *time)
>  {
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	u64 val = U64_MAX;
>  	int ret, i;
>  
>  	if (!mhi_tsync && !mhi_tsync->time_reg) {
> @@ -1756,15 +1757,25 @@ static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_time
>  	 * transition to L0.
>  	 */
>  	for (i = 0; i < MHI_NUM_BACK_TO_BACK_READS; i++) {
> -		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
> -				   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
> +		if (mhi_cntrl->read_reg64) {
> +			ret = mhi_read_reg64(mhi_cntrl, mhi_tsync->time_reg,
> +					     TSC_TIMESYNC_TIME_LOW_OFFSET, &val);

Since you're passing mhi_cntrl to the read_reg64 function anyway,
perhaps this could remove some verbosity:

int mhi_read_reg64(...) {
	u32 val_hi, val_lo;
	u64 val;

	if (mhi_cntrl->read_reg64) {
		...
	} else {
		...
		val = FIELD_PREP(GENMASK(63, 32), val_hi)) |
		      FIELD_PREP(GENMASK(31, 0), val_lo));
	}

	return val
}


Konrad

