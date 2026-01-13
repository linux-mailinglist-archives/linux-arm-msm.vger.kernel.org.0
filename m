Return-Path: <linux-arm-msm+bounces-88644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03343D162B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 02:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA65A301EFE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 01:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6256A267B89;
	Tue, 13 Jan 2026 01:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AK5iWFwe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZbbI0+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF4B18FC80
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768267888; cv=none; b=mgluH2zAJsP3pOAV69ugY3MQBdpllry6eviO8g7O6/WUXU4D1idJ+kMpdMgDrKeWjlcvKSQAY3A1+NPExc6uk+HPP792GnjGjy826A0Rlr5vLAtuASUDUdL/TePow19rg3tb9ycKhmLd/ZbtVmsGF45t6j546S0UvFRYE11Ubms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768267888; c=relaxed/simple;
	bh=y8CPhyuFVHLiP36bSeJso3QjPejVhZSQE3nKT2VHoc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsBHR7dyQX0zow9lmUg6E+cynJj4CBd5BrZ3HraIePl6q1ddRnzfgM/3FsNVzRrjLOt3mxNdBUmnIGcpaskwYp4GdcDQspjN6uQXEQIuqjeWxTL/+mF3tJNIniqTqWRsVTKhWt3Fdl+x0vAHAH4rWkTeoFh+eiOaY9/qN+t46AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AK5iWFwe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZbbI0+E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN5Tfb2605135
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YAml6rqVXpHe4W0+Xcni7G3s6LA9a5uHpuTNygLAJrI=; b=AK5iWFwe6gac+hh6
	cQFq2XzYm2KUUVl7mWYQeufjpcrCId3UBoXjyNdkAJCv/tW6kkJ7wFCamw0qS4fL
	hLGxJIxi0mnoruqA11FEDpvB1ovOo3KhW1iyBCsTX36Uf7KSIBLlQPmwCp3k6RgM
	GgVPQZiA0foXqsikxgb4UDzpcT/Wdh2KXPtckIMD4wb/kWlE69/GSr8/G3kHRVUM
	447blMCYRuY2IQASQ8I2OrMjlH68EI90T2jDL1JsC/fP3RrjLCywxps+RFxwWf9A
	Qtp55xNZo+Yr8CPF33Un/TxzXdiywE2Y6KjZO8DRSjCJHSa15kYkzl4Q31OLdZ88
	sC8ccA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn7uyrqqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:31:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b24383b680so2829456685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 17:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768267885; x=1768872685; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YAml6rqVXpHe4W0+Xcni7G3s6LA9a5uHpuTNygLAJrI=;
        b=WZbbI0+EEpHFUrN5b+aIiI6DIQYJ6DU78cojk5eG70KEVdrBog+LzGdF/rM+Uz7SNE
         MZQK4DiREIEQuEFQZCLyC7qo/ylwig7PdFhDEkjGqKIVzH8Dtid7sllyVRK7h688vCoT
         ycT1M8BLSgSwaNSXJAP44yMO6JEfyrV/jyCdo4eFqTa4bJCaOBv34/Z8xaJDvV69PC1d
         cH9uQkz6nOApSYh+NSJ5kpTeoBN/O5vrGZVZn1y+q+23ihqF0uDL/OorssZEAVx05Zy7
         f2MO2PlNXUFniuMPzs9iSApiafqBhf5WZze5Ph/RBFP8MzG8D5lfJFhsvE8NbgDiUApi
         Lqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768267885; x=1768872685;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YAml6rqVXpHe4W0+Xcni7G3s6LA9a5uHpuTNygLAJrI=;
        b=GfQCgd/PBcCm+oxBsdO2yiN0v9BmoyoIIktxQpWlus7kzwfEw5LA99Sj57SVcDsmp0
         4H8BchnS9i1PHQMYkg1Z60Y5F3FU8wTYCWEi0fBX/FNSYcpcorJUSL9wJ9jxAwYA8Fx8
         RlF9lBag6pQSfIzh8d46UIhQYU2jqTuZAglrbd7Hp6W8SlOGU7OyPlUqFAE4wFhQa9I8
         asdmK5+KKBphHrpM31Roey6csTjSYyPcJYfxvUU6lx7YdpTJrpYiXYAAHAzun2iDrSHs
         NcUwshTY36QCmXK8Zy1pukACgc5TS4TOuVEBvpD1/1P1d+q1I4lKxzIykda7rAmiOKvj
         ZX/A==
X-Forwarded-Encrypted: i=1; AJvYcCVND7IzdR9JzVuggGpOICAWsLPbqHVeP+MN2BTCoXgKj1XWstLZb7td2FLXJ400vn+/V72eIcg5wvFsZ2qA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+sBoip425zK393AQcUWSBHQiVh4kVaVfpZsjNnjoQOUrColuD
	Z6WGaVb2AwGju1/HGmLf1JCc6eI5Wi1sA80FF0QWOqccH0qI6AE/OdVzMx1eqbKfqYnxQ01XGJn
	Q6yHZO0ui3lb+EcYsUDTtOgp+Fw27WXmmLm+5hWXGzL2jA3D2kIeQo16w38hRKA0suuEVOAvzED
	TG
X-Gm-Gg: AY/fxX4qmHh/3E6TJ9r87TSmm7mtlOIkSqY45LmvFdOYRKCm93cY57wYfIoAtVhbnMV
	+1hfXHMb/eYfj0polQ1k38K0UBfTGEaptBxyQQxJFnpyebGZJ1x4+XNXxUTZTSiEWV6H+1v5SNf
	u1q5YGLhROrpsUBYs4fEhXm1I3dAFMSabVTUr61dlYmwJ4TGoXPdfzvGSvqZ1w+NoZZcAxHGxxl
	PQlgJ7HXAHFcgnA1j7QaJn/OAvb5gRWQetmbdmapzxy4jUrNo6RyP+p/cVFnzICFck2bWGuyy/L
	gmvnoO2f+37DKms1Pbf0s+igZ/m0UfMd0Fp2OmtxlTJGjOZP1vlQo/6MAdbTkQQDf0OZJGDSoJY
	9YTNl3EJVCUYzYdOujm+/HWMCYRP27plhQXEXSU6j+8D8iI7Z0mpmoNZo3Rz6+kcY+C3L+BayKI
	YWrgDW/9Kgtxe6nPLanJx+1OA=
X-Received: by 2002:a05:620a:2915:b0:8b5:e783:933a with SMTP id af79cd13be357-8c38941e0cfmr2533352985a.77.1768267885161;
        Mon, 12 Jan 2026 17:31:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0R96lsVl9eabvijfvI7TD+QVoABtxe96JSTxPCd3UynyTt83PsZzo6lM86qgOShmt1UdqUQ==
X-Received: by 2002:a05:620a:2915:b0:8b5:e783:933a with SMTP id af79cd13be357-8c38941e0cfmr2533349785a.77.1768267884755;
        Mon, 12 Jan 2026 17:31:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b6a2b8330sm4933244e87.10.2026.01.12.17.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 17:31:22 -0800 (PST)
Date: Tue, 13 Jan 2026 03:31:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>, cros-qcom-dts-watchers@chromium.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add support for ECS LIVA QC710
Message-ID: <e7j3hctjlly44pjwe3jvjtpjuj33bdvpyo6pzc6o3q5tjjlyib@7evgyweq2deg>
References: <20260111085726.634091-2-val@packett.cool>
 <20260111085726.634091-6-val@packett.cool>
 <wyqml5ywfzwh3uulp4gzlfzx24kb2545w36pkpnz5g27xtnqoi@yywysi37tdor>
 <3dd54179-7a22-4596-a6ef-224530c4b2c6@packett.cool>
 <2f0d6bd9-0786-4445-94d2-5189f6b44d01@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f0d6bd9-0786-4445-94d2-5189f6b44d01@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GodlfamAtOfLjiCWlmbrV9fIsugXXH2c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDAxMSBTYWx0ZWRfXyeJ6LHjvRXG5
 40DWmRhoIYB8QCRaZL1tLfZWmIa8zGogi2/7vD+5xsM+A03iY2DfLCP5yyY9FOnOU82q8lcVRK7
 5QWUEWo9TFpwS/uOUO2pEXfXb/B50YiqskqVUsn4XucGVomLNkzcJ5udR5TGElqJARy9GEkP0NI
 dICI4aU5vsH7WLXTT0dfaYR7g3EHtqzq/kmGPG+t5rAWwNX0dduRMPape6b7HIIvuotSwR14ChE
 NjDo4GJECq1udelSRXEuGHrSuh8xqDJsSCCkPuI7Ru/euMORfcrCpH4YRzZAn0o74KJGbU2q/Cv
 Xjz58bRh/bqXB7fWAtJIYDnYjvJp64ykbpvEZB2lIG+pqL58RkRR25LUPVz7lXZP0PE9gEjehwQ
 DV5jNKc6KRRAJe8H2AOHMXw1mKm7lK1Cpk1I8zLemoaD5dNsD5oaGP4QjAn7Z6ayIB/Owlld2n8
 8IPPhlhiVd7WujejKGQ==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=6965a06e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CWH8AaTQSaRSEq2PPCAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: GodlfamAtOfLjiCWlmbrV9fIsugXXH2c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130011

On Mon, Jan 12, 2026 at 11:50:25AM +0100, Konrad Dybcio wrote:
> On 1/12/26 1:31 AM, Val Packett wrote:
> > [resent for the lists as plaintext, oops]
> > 
> > On 1/11/26 1:50 PM, Dmitry Baryshkov wrote:
> > 
> >> On Sun, Jan 11, 2026 at 05:35:12AM -0300, Val Packett wrote:
> >>> Add a device tree for the ECS LIVA QC710 (Snapdragon 7c) mini PC/devkit.
> >>> [..]
> >>> +&dpu_intf1_out {
> >>> +    /delete-property/ remote-endpoint;
> >> Why? It should not be necessary.
> > 
> > It seemed to be implicated in annoying EPROBE_DEFER issues.. But you're right, it wasn't this after all.
> > 
> >>> +
> >>> +&pm6150_pon {
> >>> +    status = "disabled";
> >> Do you know, how is Power-On routed?
> > I think it's handled by the EC. Keeping this enabled doesn't make power-off work, and doesn't make the power button deliver events either.
> >>> +};
> 
> FYI I don't think a modern QC SoC can turn on without PON
> 
> What do you mean by "doesn't make power-off work"?

It is basically a laptop SoM in the embedded case, so it has EC and PoN
generated via the EC.

-- 
With best wishes
Dmitry

