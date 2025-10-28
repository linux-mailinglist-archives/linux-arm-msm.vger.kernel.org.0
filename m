Return-Path: <linux-arm-msm+bounces-79187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5799C14A0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 13:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DE24188FA01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D9932D437;
	Tue, 28 Oct 2025 12:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElAR2GG7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3F51E3DF2
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 12:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761654477; cv=none; b=kKZHEu1wN8/okA1F30psKf3wq2ZRhUlvxoChZlXfdhs7HJ0TsLAlnu1QFBocyonQQXnjvspJezyfjte+FhTbTUuK7uJIt/fytW/Fq5qESTGE15ogBH0sbJORuB5y1UGFAhzB9Gk6zvXoQ2dBSn6FsghBcJn65CYRpH1XikN5iTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761654477; c=relaxed/simple;
	bh=PZnN1BciWAv4RyQ3dAg0SfBIWStJA/xNPw5bwc6ouD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFFMj2iEdy3pIE48VZ5n72VWjgKmOhwEcvJQpV1rSI3+3KRZm3VgnzL1afcpZtAorXjxwwyOnh26Hjw8cesTQlvir+/kPEGyOFdZgeek1xef/bzrNdClfI1F5ficycNaYn0a8XsEiv+fVHnVtC00uIUAsm1SK0MFKYUuqb2Ruu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElAR2GG7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SA2vFK1237678
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 12:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LryPdRL16bXEb1AooLKVsQ032DrnX2uIv4qb5y2T2f8=; b=ElAR2GG72tMedJbR
	P+vW4gcbjjE5sN5ny+aB8QLxOMQH260/4dwxPjJ4KQzFHekyJYlxpPpGfwhH3+BD
	Fz73SeGP5YBXW2i0zzstELDU/lxx7eME25kp6ypLptHVYQfHqLMrHUvtS/fTjQel
	/mTup+k5yrtEYgkcPzxAV0AQ2l51ogzmnCkFNC9qwP853gSeStetK22k29k4Fedg
	32ZpU93Ns+o/VR4IjnegAw1/Sd8ZXWz8ngrHyluiSR7tU+UF3JKkO0tbd5Eq0z1g
	NcIEr7RAWQwSRmLB+Z7WY4He3kd3irVKTC8XJM9Bn7m3loWkm4pSYMBVPo6984+Y
	V2cASw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2ur3gcxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 12:27:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6097ca315bso12248430a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761654474; x=1762259274;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LryPdRL16bXEb1AooLKVsQ032DrnX2uIv4qb5y2T2f8=;
        b=pBbiz1t89GZ0SMhJO/Nz3+/O3macIvSz8stvBkXBVXI1JwCuwJy3Hy9vtabJo7GGw0
         0AUosz2qxGZqX022lo4DtMg6bTqVe+ej4iS9gh122kJQEfntJxTxTaH++0qOWO/GA315
         LdPuUBbkdiePQ4Dn9wh0p/hxKqAIxzSjgOvsqSdr2vT2J0DDKbpG8eQrOGoF/oQxbpGD
         0ybjkUZKhTBgCrMmm+G7I4lY02dI28ymv37X3e1bxc2+ceiXXnFtnwHexAxAOYSM6swx
         jCCnRGtFL5v+UFQUCNXQD8TGebSz7qoti/+0F3Q7DZDbpQJ61MFUJGdgIWjpz8EkHVho
         Wvrg==
X-Forwarded-Encrypted: i=1; AJvYcCXRC3ojzSnKd9IRmvokNpoe+kyUTPrVdP95P2+OzkXzZP5ZUoONN0REBTFMf84qf28vm9M5HPRqkt1JY63C@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0nN+4qiL31dJ9BSPVXZ6CsIFtRB99MHVnLlYO59Zsg8Ym9W1L
	yCpIs4vJ/SmYtF0d2NMKujICYFZB34RS17jfR105v5K8xtqeohbMpnGNVv/0/SY2MflRgj4bHPO
	z979PnTE+QoKonx8cRehAimqvgJTr4SSS2/mYWvy688SeHldnMpK4cGkBWGGiyoe2P3YX
X-Gm-Gg: ASbGncuJpDQnpMqD8gxTn19BkA4Yz1lTkhm2YPqSM5nt4mRNhfUM7uhjkl4MlhPPLou
	6fzeyVsx46U+G8J+5EgDi7JKMLd/E78W1xiKugbSLExWZPTlgGV4FujjZ0cR8IHcqrpPyyF75G2
	PizeoaHKbc/BP5J8vGZmVpe1MdFtmnDojnngChuVfe4PoCjWZXtcJiT5JHIPDWFQvrm/LUL2TQi
	598aeVXvo4lfbIpKtKgFNyDOlq9GVSkUVOl9Io1lKGc0Pi9MYwOxz4LA5PucfgOZ80N4h5MSK8C
	1lki22A0N4LEqYqpu41aRgV3yK4OyHPb9a5+Fphrh97ctHDuP9lTbXAydroVGE52FFGkHieeN0c
	P3uGkqZAJ6MHqqNhCv79NTcfuDh3r9VUu
X-Received: by 2002:a05:6a21:6da8:b0:2ee:5fc4:f72f with SMTP id adf61e73a8af0-344d3d50fd8mr4028855637.34.1761654473492;
        Tue, 28 Oct 2025 05:27:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBRivKLorJLdg9lCPrZDywcIC5+AlHJpBkfQ6yi66FCG+ba3o3jLZykm9l8kqxzPvb39WUcA==
X-Received: by 2002:a05:6a21:6da8:b0:2ee:5fc4:f72f with SMTP id adf61e73a8af0-344d3d50fd8mr4028814637.34.1761654473005;
        Tue, 28 Oct 2025 05:27:53 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b712d3fc7b0sm10730601a12.29.2025.10.28.05.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 05:27:52 -0700 (PDT)
Date: Tue, 28 Oct 2025 17:57:46 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3] watchdog: Add driver for Gunyah Watchdog
Message-ID: <f4d80be9-986f-4d37-9c25-725eff7bb653@quicinc.com>
References: <20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com>
 <25f7ff09-08ea-4969-9184-9fd01b097558@kernel.org>
 <76479593-c47b-41a7-8349-5d7c1403f7c0@oss.qualcomm.com>
 <73955d58-544c-4299-a099-bfd9e5912a40@kernel.org>
 <636a1f99-acd4-4904-8fae-f159646cc1a0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <636a1f99-acd4-4904-8fae-f159646cc1a0@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEwNCBTYWx0ZWRfXw2ZO4ozwcD83
 qpJ0pa0EBin0GQJGn7C3UVYSUdE5MA4+TkVL7Il3ddn9Dmp0dVl350taxXOmjG80hOvreAUnASn
 sMGSJ3msyXTSvvh6oN6gaU6+l2dBblYXJjXBVixgLj1bu35p2UJkdavpavKaXvqB2OAvpwhkUNu
 Yfaeq7fGL2tMWmOFfajTg2DmScpTLCqeQMIs3rzDWO/Lwp+j7+c7Eupb1Xw8zI7ioisPTbl6G93
 YBm7NpHJS2BIe0bpvb3llhh1OaBk95M2Pq5P+K7++GUh62TCB/RocLAs6trkijf3VcVs6KQQgGM
 ZYPwLqWc9cUGH9b8oGDhGSoMZ+e2La2a9k2L4iyMd3kGHVc31TycBt8kxlRGXoZnTjAhLv3PdEO
 EvuRyCAHpmDDIH3j8XcPqg+7OwzEHw==
X-Authority-Analysis: v=2.4 cv=Jub8bc4C c=1 sm=1 tr=0 ts=6900b6ca cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=HKh5ZDWwfVBa59CNq00A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: OnV5PLuu6Td6aXDRni_U-4kSvfI-u5Il
X-Proofpoint-ORIG-GUID: OnV5PLuu6Td6aXDRni_U-4kSvfI-u5Il
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280104

On Tue, Oct 28, 2025 at 12:07:40PM +0100, Krzysztof Kozlowski wrote:
> On 28/10/2025 12:04, Krzysztof Kozlowski wrote:
> > On 28/10/2025 11:58, Hrishabh Rajput wrote:
> >>
> >> On 10/28/2025 3:10 PM, Krzysztof Kozlowski wrote:
> >>> On 28/10/2025 10:35, Hrishabh Rajput via B4 Relay wrote:
> >>>> +
> >>>> +static int __init gunyah_wdt_init(void)
> >>>> +{
> >>>> +	struct arm_smccc_res res;
> >>>> +	struct device_node *np;
> >>>> +	int ret;
> >>>> +
> >>>> +	/* Check if we're running on a Qualcomm device */
> >>>> +	np = of_find_compatible_node(NULL, NULL, "qcom,smem");
> >>> I don't think you implemented my feedback. This again is executed on
> >>> every platform, e.g. on Samsung, pointlessly.
> >>>
> >>> Implement previous feedback.
> >>
> >> Do you want us to add platform device from another driver which is 
> >> probed only on Qualcomm devices (like socinfo from previous discussion) 
> >> and get rid of the module init function entirely? As keeping anything in 
> >> the module init will get it executed on all platforms.
> > 
> > Instead of asking the same can you read previous discussion? What is
> > unclear here:
> > https://lore.kernel.org/all/3b901f9d-dbfa-4f93-a8d2-3e89bd9783c9@kernel.org/
> > ?
> > 
> >>
> >>
> >> With this patch version, we have tried to reduce the code execution on 
> >> non-Qualcomm devices (also tried the alternative as mentioned in the 
> >> cover letter). Adding platform device from another driver as described 
> >> above would eliminate it entirely, please let us know if you want us to 
> >> do that.
> > 
> > Why do I need to repeat the same as last time?
> 
> 
> Now I see that you completely ignored previous discussion and sent THE
> SAME approach.

Our intention is not to waste reviewers time at all. It is just a
misunderstanding on what your comment is about. Let me elaborate further
not to defend our approach here but to get a clarity so that we don't
end up in the same situation when v4 is posted.

https://lore.kernel.org/all/b94d8ca3-af58-4a78-9a5a-12e3db0bf75f@kernel.org/ 

You mentioned here

```
To me socinfo feels even better. That way only, really only qcom devices
will execute this SMC.
```

We interpreted this comment as `avoid executing this SMC on non qcom
devices`. That is exactly what we have done in the current patch. since
`smem` is not present on non qcom devices, we don't make a SMC. In fact
we don't even create platform device/driver.

Please help us understand if the better approach is to just register
platform driver here and let qcom specific code add the platform device.

Also, please help me understand why would non qcom platform who care
about performance load all modules that can be built w/ ARM64. There
will be many init calls and platform drivers registerd but they never
get probed at all since their platform does not support. I am not
defending our aproach, but trying to understand the rationale behind our
approach vs alternatives.

> 
> NAK. It is waste of our time if you keep ignoring reviewers and force us
> to re-iterate the same over and over again.
> 
Thanks for your time and valuable feedback. I am told getting negative
feedback is better than no feedback from reviewers in my upstream training :-)

We will incorporate your feedback in the next version based on your
answer to the above question.

Thanks,
Pavan

