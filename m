Return-Path: <linux-arm-msm+bounces-75491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FDFBA8A6B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 11:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC2D01887E13
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 09:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5076A26B2DA;
	Mon, 29 Sep 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RgMP935D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A2121FF23
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759138503; cv=none; b=YMHKTsBC1tI3pTEiwSDzHoyRjn1Pc8yilL7uzDT8bpevih3Kdhu4XhvACFxmyc0w6NwCSCdyJD6em9AMkAvwCI4TVwQWs/cdUJXX10du7f4KR0l7ojQoVqChexDShdP0Wy+RbkQL9jGwGwR9QWdQWmCGNbFepgdPCrXmR6v07i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759138503; c=relaxed/simple;
	bh=mRsX3dKnTVn76I3diVMRJ5PswMmK69nK7/3BH+Z/a+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxNEOXkyMOQ+Nav6zlqhCqbpFbAxXsPcH2KvqWPkYOunkf9VQqQ2sa6yF5pITvf8yI1KTYAX63uh3I0BDNmkayHDEc1PoHZSEOGn8PAGzKy+E3w4DVaJXIc/Rp+7SG1+vkm+urwZIkrZFYOGK+hc3leg1UGbohoVBQrbWG+blf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RgMP935D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58T8WfMa029194
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 09:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fmYtyuvX+TYSvsQjEOU3V3kUhRzcJFG8FYtCxH2TOxc=; b=RgMP935DOHr3mR/S
	eBCkOClNI0KyaU6v5fUmAs1NJhHBRm4YeoR/LeMdiSzatVciUR1yTwE3k7ZQzPxL
	AFX3iwt11Ele7NWRlHPq+6ov1+8sfzU//Y2MbM21pjqL3Bcpjr0ZlDA/Uo0aFdas
	N7AHE9b3OgrFAB5hB3ZQaa9BdEDMLJ2Zw0RCZws2c/KdrHBUdppaF4KLuQzsMUNu
	WCUBJg+58UBd1zbNXTBAvTR9NfDPVxrXaBRk0d3fncEQthttjyCHaHjIPtBBRKS0
	4onkcwrIbrcWpDUaWSMZZTLICsdjFENv4pF+u1s7c0ft0sH5QsAgjJEMkl8uAZdb
	Sqw93w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr05tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 09:35:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4dfe8dafd18so54506101cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 02:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759138499; x=1759743299;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmYtyuvX+TYSvsQjEOU3V3kUhRzcJFG8FYtCxH2TOxc=;
        b=JmKaKPJmzObsioquZ4oE461yCGrQBP06sGWvCNzx8C9ftCYruTFtolhCkAChl5MH0b
         cRs+x/LVvoAiOREMXCFC7rghdwIAJTdQEtlGa9By2rTKIOOr6+pK+CQSGQ4x6qTHy2Dx
         UOy7zreBfVPw8qF0P19XIslBcdxVxXVIjMlA+yyfSqOdsqP/3CUJR5KFsnQbkrKJrA8F
         rCsDOXlcE1gFyJjgTJ2J8nwzsl7j3+GQ0VtRGdfNWYhDfZ0nnwpTPDTN/uWyuGwo4cDL
         aAFxAzFdpLiAf3SxdZjCCNny7OnGxmpY14YaX0SUf2qUOplr/1228V+JD9CGEdQQalui
         kUvg==
X-Forwarded-Encrypted: i=1; AJvYcCVTSVwsr7YzIP3CrP9zRaLUTk+koiZ6ikGLnjQVq0FxVu8j5bHyQkAthoCINS5nKR6ehOzHsTAKpvBAKwK0@vger.kernel.org
X-Gm-Message-State: AOJu0YxCIRDvMJhO0GWpRg1ls/gOY5d38BWMTZw+KAYv7C8qZlq92ZU6
	RNIQZWheL7a+26RP8jHzqXldOIqjXBTl8A9QX5z0wh+oQigpnNA17FzdDtMgnd195CO0jwTDAt0
	zjFTw4A6GnVv7bUoPqYd97IsEfEnqNZpPISbf65f7loiMb+mJUKlipZVF3eFrOe6aXsMt
X-Gm-Gg: ASbGncvVTyS3KCJGcr/AEZlO26Ij/sNsV8dxWneB1vUCtrPka5Kc29kxPxxZLKPL310
	MEwJw6FcFgOBnnRMxoc0rClTabzpy36U2Ug/aSYe6gfSVLbZqfNRuWHzrVDVU2mUviS/wygDZPF
	Buit8U9s/yUHpFCEx/BR6QQaVFm52zJYW5TxKPTYKqgZ5JA/8ywUv+jn2OMU7qOYEP1nYldVceK
	cgu6nMn2g2MNrM76s5+gklegruu8FuhcefxLIMCQrylJglXujIwTFWaOu8PXN2ARaw+a5Rpg61e
	GzcOoIjVSryB0/uJaenH4BXkhCht6E3ZLEgzkmd2xcuMcqOPCFdrG0lVwE4+UZdCfVKP5Xp+fOb
	CBVWMBpGSHlc5kzPhoLVbf9o6+cBXAy0um5tOqbJAj1f4AQHSxwtx
X-Received: by 2002:ac8:5d02:0:b0:4c4:695b:9712 with SMTP id d75a77b69052e-4da4b809717mr225385781cf.42.1759138499600;
        Mon, 29 Sep 2025 02:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAVn+j+N/RqaW9AiYNNjjr5aDBEy6eHhXUJcQNHS/ynl5kMhAJNVTVzSOT1Symi2t4TjZugQ==
X-Received: by 2002:ac8:5d02:0:b0:4c4:695b:9712 with SMTP id d75a77b69052e-4da4b809717mr225385321cf.42.1759138499151;
        Mon, 29 Sep 2025 02:34:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139fb04dsm4059633e87.44.2025.09.29.02.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 02:34:58 -0700 (PDT)
Date: Mon, 29 Sep 2025 12:34:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
Message-ID: <o6dzhmlicwiezmxlb5uqitx7e3pjpyuhbjqfumivbdkru42hvn@r4ksfa6m5nd2>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-2-611bf7be8329@oss.qualcomm.com>
 <CAJKOXPc57_0pJ2ZWf2cKSKAcQMc3S_mHKQxJDzWH7t=mgim3CA@mail.gmail.com>
 <5820a9a9-4474-4c4d-905c-0efd9442e5e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5820a9a9-4474-4c4d-905c-0efd9442e5e1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfXySyzKyJyuai8
 un36uKX0QK5cG77yW+dTfMOo53Ah/Lx20DUqWJlkQKksCUVFvtSF3+bBFqts4wgdBRevBiq0MUd
 j7wTVUOCdvKrdQqds1+Il1aK3cEXgFGfkAxHD+hkdHEe8bbCbQ1H5P7pwgyfsRIaFFIWSCBhKWE
 8cFYuIK/pN8XlnknFvR79pJGz98KW19God/3XKHAdsD301HuYUTTrvDHxzq0oPAq6QjARBZJiiJ
 Mmzust+N3FoVr6jIftgSAsP1gJ86sJ5IkGHNKTZFsi3hcynqWnDR+ilB6a+x2rbTCj/0Ryxc7RS
 4lUyLua4cjiKERnWPhN3Fvnb5ZG0V5CvQP0C7tVT93II/sdZm3nEbISqzx33M5VPZ69tRnxpcYa
 hi7DZxOYs3im9oOwPHGgTepWKGpjJQ==
X-Proofpoint-ORIG-GUID: CDn9Kra02188kEjrePEe7eDbbZlUP5hn
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68da52c4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Gqe_g9I57pFxb8mTp9UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: CDn9Kra02188kEjrePEe7eDbbZlUP5hn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082

On Mon, Sep 29, 2025 at 02:20:54PM +0800, Jingyi Wang wrote:
> 
> 
> On 9/25/2025 9:48 AM, Krzysztof Kozłowski wrote:
> > On Thu, 25 Sept 2025 at 08:37, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
> >>
> >> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
> >> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
> >> interrupt.
> >>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> >>  .../bindings/remoteproc/qcom,sm8550-pas.yaml          | 19 +++++++++++++++++++
> >>  1 file changed, 19 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> >> index be9e2a0bc060..031fdf36a66c 100644
> >> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> >> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> >> @@ -35,6 +35,9 @@ properties:
> >>        - items:
> >>            - const: qcom,sm8750-cdsp-pas
> >>            - const: qcom,sm8650-cdsp-pas
> >> +      - items:
> >> +          - const: qcom,kaanapali-cdsp-pas
> >> +          - const: qcom,sm8550-cdsp-pas
> > 
> > 
> > This time maybe without HTML:
> > 
> > This looks wrong. This is not compatible with SM8550.
> 
> Could you point out what is the difference from your perspecetive?
> it is the same as SM8550 except for there is one more interrupt,
> which is also described in this patch.

I'd second Krzysztof here. Your description points out that it is _not_
compatible to SM8550.

-- 
With best wishes
Dmitry

