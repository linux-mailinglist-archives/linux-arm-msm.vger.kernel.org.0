Return-Path: <linux-arm-msm+bounces-78524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B872C00598
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E82C1A669D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A574E30AAD7;
	Thu, 23 Oct 2025 09:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e5FNKPF0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E44C2D3737
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761213165; cv=none; b=UuvfWPMnwwx/h89KBUztN3bfLxTqlLgT4Xzj1GykubTvvZHRaxgIB/Wsl8c21NDEaVhgqu4Q/1OjTQjOGbSP8JbdctiMJEOE7UCYT1nPkb7t2rdisuSVX+bwGRJg6uMgyI7t4p/5AsoBpxsgXJpST4TAE8zp4OLA9//6eBJwdno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761213165; c=relaxed/simple;
	bh=VzrZOgYn8CZVzBcsfs2UqdIG8pkiX7gsZ+Rc7+O5leQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZvAaCY3CnfXklLvtPc5mdozADqwUx6LSj3ZavNvkmwypMj8Fm61bHU3n7yk5eUc+V8o3/P3W62lChpo2ep3subCPoVsOImSjflN7cMmp81npOfCQahfrIloK9eFGQOS5tfzlFtBXNouS+MnZSVtbTj10z4KVT9pjpFkH+N2gYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5FNKPF0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6fABN025832
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lj4HGsR9qRam1xu/E/CQi8Qt
	OyeipH/qWlPK+yXMX3s=; b=e5FNKPF0Zf0SW+bOQun0ZKKrCe4aazHrrBYYJtZr
	CcQvJguaZm0s6DGPnNakYReyeqfAuv4cBK2SfjdMxZBF0TE8KdhPWtlX1tnGo+j/
	BWFz035c9Y/jdFQNMeyhu0LVKI/NSAQ1R0P3FbrjuX/HJoipzNRDzsOQ4zB6qp/C
	5jd7BVk53ENCamvpoqM3kjiXDnfna0NC53B66StBK+1GwJPbqHfpY4yiIi/EgEtP
	s3MU2YhUzV1yWcuiO4c6CWgqrRfKTBTTu+uMo5MmuNZS4hkqlVnI5DJf1UFcW5wm
	vPpCj04lc/8VxEWLEeWRec+E+xF2eyD/1UntRiHwStNZYA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kfqpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:52:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87dfd03fb72so31349486d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 02:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761213162; x=1761817962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj4HGsR9qRam1xu/E/CQi8QtOyeipH/qWlPK+yXMX3s=;
        b=etQkQxqVFWnJzuIE1zMmYTVL+qPUMJ+qEyX4XUrHz4mOjDO4yBwGuDbPJkUpkhzeFB
         IWJOCDdPGoHMfhga39WlvguRKX4j2swMxveMj6uuUotB+xC1WWNV+HVfeOhNG5kop9TZ
         cqIC6FQrf0zpzuSR/tqPg+0dAcVodu6tq6sTKYTXFq88l8pMC2ga8Ls+S3ed+ah3TlMX
         8xa/fee22aJLQQ1ziiEeQ91uRilRanjTm9Z9x2Q0FTgGRrFaPCkN4rahLgpyEtWhUqOB
         GLzC5rxr2AJGqwWP7RVDL+vpjOg1sg+Sq9fsVhTlqLJYy3GsY8E8AU8Wn5TFRhqMw+4J
         f6lA==
X-Forwarded-Encrypted: i=1; AJvYcCUqjpEt1Rm4xZxWuAKmrluIohaq7BVt5uzKwSMWkREuq3dGST7dvovwhIJH1dwWHfCRISumotuXdeLKLCGY@vger.kernel.org
X-Gm-Message-State: AOJu0YyDphVZaF2cGdwpnUf7kChPWfF6CCmmg+0AeVRQ2OZwXmF0bFv0
	Exp2RrAPHCowTKrzl1eMwMkrHA4e1zFSMN26VdsQfWKfMe+DY3Dl98M4myEAYm4JBuxuXbF2Lfv
	gerzrEPYbbH+JH/t56VeHcGADhFoiVKR+P4VC281b+wXBpxdLZEG43BvGHfM39veM4onq
X-Gm-Gg: ASbGncv3h6theQpe6ux40wvh97La8BPGV7trifPzXrpXnoTnhkUJTtkrQcvf34fgOiF
	zdmtEPMg/ss6bLTBcDL3/MQJcV5lM8R7j0Ogz0FL3FoI/qa+4ARzQeUymE4WGQaDrWTQjgBZa7e
	Q92WJWnz+HKqkG1VjXi69vkrWyunGkzKIXX2+aZA0+K8dx6/U6BLZH8Id2ws4qG9qOV2fGtXME6
	vJs1WnPliHMab+xB0/Va81J1PWIZrSf/Adb6R1dl6SJ4WwwvKwGW7aKBQzkNE06HvCcHFxVp7Ly
	UQUuwDnWJQoVoLpPPuicTV+U2oQCiq7VOzV/8zuTxC9ZxshjBX4H8mgPsf8511AHGDVTB99hzXa
	wQC4ETFWXFE0ChobwVNCe0f1s3kUZ9Ch0+lio0fDATP+AK8ISsOdtE8qg5+D9
X-Received: by 2002:a05:6214:2406:b0:87d:e77e:4df1 with SMTP id 6a1803df08f44-87de77e4e55mr114575166d6.60.1761213162095;
        Thu, 23 Oct 2025 02:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7AbIcMz4qaa9yIcpZvpwREt3p4UM9idjvFlz0HEChINWcK7/GEpAuVvvqWLIzfePwg8PadQ==
X-Received: by 2002:a05:6214:2406:b0:87d:e77e:4df1 with SMTP id 6a1803df08f44-87de77e4e55mr114574926d6.60.1761213161613;
        Thu, 23 Oct 2025 02:52:41 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87f9de7beafsm12276226d6.14.2025.10.23.02.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 02:52:41 -0700 (PDT)
Date: Thu, 23 Oct 2025 17:52:29 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        mripard@kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, marijn.suijten@somainline.org,
        abhinav.kumar@linux.dev, simona@ffwll.ch, devicetree@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, krzk+dt@kernel.org,
        freedreno@lists.freedesktop.org, neil.armstrong@linaro.org,
        quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org,
        lumag@kernel.org, airlied@gmail.com, sean@poorly.run,
        maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
        jonathan@marek.ca, robin.clark@oss.qualcomm.com,
        quic_khsieh@quicinc.com, conor+dt@kernel.org,
        yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 12/12] dt-bindings: display/msm: qcom,kaanapali-mdss: Add
 Kaanapali
Message-ID: <aPn63QSJL52HmhGZ@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023081736.1251-1-yuanjie.yang@oss.qualcomm.com>
 <176121209123.1694835.2815069098750745260.robh@kernel.org>
 <10999a80-df1a-45c5-ba1e-e64b2afeeb4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10999a80-df1a-45c5-ba1e-e64b2afeeb4f@oss.qualcomm.com>
X-Proofpoint-GUID: -SA1wBroqkS1qv7bGDEq83KwwS5mGh4y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX4TvU84eqyAK3
 fVwF5c8irWy4/MKuJua/aOzX3XRfGXLslzJlTv4zt6NwGWKf/Wmtu0+A7zcd8dywaFpa+RVzDt6
 lAjRTHqxPr831FMfqNgDersiWzt7BVRqA5dzeMqK9oQk3UBe7G5Cm/+x9cV5A/pA9FWCvPz5qnN
 eWirxkpX/0QUmf+73m/+MDQAYsChR9YKhi+fV80KyFg/cX4wjQvod/b5rJva8KMmCUv/i8G/rSz
 VBNAQF8UdVDxfb5vmXUbwqzJc1G6ZmThvBOaHbZY//0wEPhDJysdfvUNmusr4Mbua6uisKf+oVi
 bug5fDMrlWhHfhTY/MSeUishUyde6XXnWKepXo9JTZyr5VvymaVrnWWWG/zF582znl9sdFt7R4+
 xXk3uBz0yFAlwXXQWvfEbLorGBEa1w==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9faeb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=i8jsQQnW1KsEJaHduVgA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: -SA1wBroqkS1qv7bGDEq83KwwS5mGh4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On Thu, Oct 23, 2025 at 11:36:42AM +0200, Konrad Dybcio wrote:
> On 10/23/25 11:34 AM, Rob Herring (Arm) wrote:
> > 
> > On Thu, 23 Oct 2025 16:17:36 +0800, yuanjie yang wrote:
> >> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >>
> >> Add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> >>
> >> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> >> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> >> ---
> >>  .../display/msm/qcom,kaanapali-mdss.yaml      | 298 ++++++++++++++++++
> >>  1 file changed, 298 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> >>
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dts:26:18: fatal error: dt-bindings/interconnect/qcom,kaanapali-rpmh.h: No such file or directory
> >    26 |         #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
> 
> Please do what you did with the other clocks and simply refer to it
> as some vague &rpmhcc_xo_clk which doesn't actually need to be defined

Thanks for your tips, let me check and fix it.

Thanks,
Yuanjie
 

> Konrad

