Return-Path: <linux-arm-msm+bounces-78421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E874BFEAFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 02:07:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F20FA50344D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 00:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4AF4F9C0;
	Thu, 23 Oct 2025 00:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="japWMUgj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352EA29A2
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 00:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761177969; cv=none; b=sLtHygMIapUetjhtSXOEp4h9ORfBxXt6HJP1jdUD0cj9nlarmsgBcYDvIqTjqAqZQ2iQlLl6XUR3EtrdAoZuXRdAyQLagnbQ1zqzlHiSLw9L3wIrSmqb2KgT3sISCn/d9rAFzmR7UEymGLTsxcg4uM8WcC8jQrEectp+kB+LzMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761177969; c=relaxed/simple;
	bh=VwFu2pqCUART756V66FC3WXoUKMk9AaNAqLUtmNd/0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzFnIbBXNgh1rxOwII1gEgU54Ms4DIOTjKfXh8stzGWKdO6cGSng6+AhT3coJxeMojVXcBFkWd8ULfL0MQV9iR8Dke/i5+25zbHQlEJiugdzxFdu+jJvOL+cO08Z1a6tk5+zsagk+NzW6bCqTHBZsZ9t/fl1qU3AkaJkVmHah0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=japWMUgj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIendG025827
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 00:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YwXZ5EJgF3RkMDIp30Ap678K
	ahXPe1cvGbyvyzD4Fnw=; b=japWMUgjE8nQcrGptptNoSttn8Ogbpv1yYLNr4ha
	Q39CrCxGNupnXejONRySS/6ELfIh0m6xBTCToB40El5q1c5iRuERXMy/g2dTNY+V
	2TaiinEnw37yx5DblQNyRgJelyaz743ojzkHd2g7L36bf0dphAouC8fucGznFH1K
	8W0rrbMDcM2rGXIiLHLi7KUgtwIWA6+aJvKPKG0nvtHgb/3mkSbUguoBRu2SagDi
	Uvj/zHHpjRC/fkSjxOKR1VQPVj9DnPDlAzqmSiidy8dvIYx8zAZjzzz4zpn4rA4C
	MszCi3mtVT9tsbQAXoY4FZE6EH6hKRR6/xPSyHr5NmMmmg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42ke8sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 00:06:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8a802113bso5540921cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 17:06:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761177965; x=1761782765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwXZ5EJgF3RkMDIp30Ap678KahXPe1cvGbyvyzD4Fnw=;
        b=Gtw3xs0SKGgpCraoc5u7xdOG4WvZSems351JDXknZn9GLp5Rz2bVS0VbX+/eszdToQ
         +39uiR5nvtr8WEuohc2uSgpiGANH0yWQL+X9IBAEC5XPTI2c05NpLifhSeqrkUzDoZNx
         o1+7/AWHqnjurYqF3OaG0+rvQkP3AYFmZJVZw2B4XS07DCThyok33U78iuODUUPwz4GT
         Bi4EBNAlOmoSgwwWEarDg8bqklcS/Fv1eVdZNVk2h80JFykeHYc9BknMXvrIKAVfj53T
         LJlpkOvnUZPSu4HbRdx+wClLRxM2VEtejiJqD/Ds9UEojDe7/E6O9HUhWcduzYFOqNAs
         J4rw==
X-Forwarded-Encrypted: i=1; AJvYcCVuytoZCDZkQGIanu/NYkzFi0uNH89f7UiuCB8KGEg+nFIDSvBwQHFDbKcxfOKf0a4HzjkSj9moGyQ628gH@vger.kernel.org
X-Gm-Message-State: AOJu0YzI07ZhfAR5/YDzHQhgnntdTs3UP4kitB/ZHnuCn8bnhd/lwgSa
	bNe3/Z3WTwAVwXURQi5O4i5MbVm7pQnToHUop+lf9kSCcZ1RVCHKHgc7TNZuqto8CzSzPTntVuU
	oMqTtlfAGmWpmi4NhQcakk1/xec+3L149aSxSMSyX7AUQwH90UYiaMQymo22kwtCep3SG
X-Gm-Gg: ASbGnctS691r83JMOfRypeTXQCK248x1YqIwrrrjRqOnaY0WR1Z98LAeQ7WgGiTyW6K
	3NkDP+aE7w5B18re6+4zeJ8GyJ+XJW9FzqfZs+MyYuG6UUubiVz0F8OXmiqG1jHAiz6M0zgS/E4
	qpWsrpIUmQ0jrLeDHNsTgMquYlTnOobghFEqBA68lR+ARTq0bmNicmkFXQcT18mseWEXnA94aYo
	8JIs0kF8WADId7HqfyX0gnzUUQEsCNomtcOXRJIP6e8KWbM8PQRCKUUz76xKWhECMWFBRm1SLug
	K/ZZl9JCvvCbXgtJqUyB/UeWTugFTFKpIT/VIWlESdfE6pvZwPInZlljY3djDcb7QamfwT/cbxr
	x+sfT/ADVYWc0TQSt/7rZT9oxL5yIl67vM/gB8gGS8qmjrLa2vHGw/m0gSaJQniCTBOIYQDAxz9
	fUCKWF9utsO8Yq
X-Received: by 2002:a05:622a:138e:b0:4e8:a9f6:355 with SMTP id d75a77b69052e-4e8a9f605c3mr220955031cf.72.1761177964887;
        Wed, 22 Oct 2025 17:06:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDNjOTVSPDTOLMhvrhjQF/rHxfIIgpodkg14JMuex89C+8dkQsRhvtmM3bkDBHfMKN9H52zw==
X-Received: by 2002:a05:622a:138e:b0:4e8:a9f6:355 with SMTP id d75a77b69052e-4e8a9f605c3mr220954581cf.72.1761177964404;
        Wed, 22 Oct 2025 17:06:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4adecb3sm237171e87.12.2025.10.22.17.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 17:06:02 -0700 (PDT)
Date: Thu, 23 Oct 2025 03:06:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
Message-ID: <mwin3lfvpcwxxhsub2whcpibuayk36f4ljrodvithfygqad5w4@cg4h6peh4v4a>
References: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
 <20251022-knp-soc-binding-v2-1-3cd3f390f3e2@oss.qualcomm.com>
 <g2iviaqetgxf5ycz2otzkpmmc4goo7xuyjmttuu254bfzqqvkf@4vybjh4eghpm>
 <4eebcb7d-1eca-4914-915a-d42232233f9f@oss.qualcomm.com>
 <dwfvko3hszsoh4ihnz3qdpsugmocbkrbhosijdw5q3bxh64kuo@o74as2li74px>
 <lz4sbvzfiij3qsa4d7jeblmi2vfubc4ltf435sh6tcs53l6fbq@7f3tfm7yiyjc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lz4sbvzfiij3qsa4d7jeblmi2vfubc4ltf435sh6tcs53l6fbq@7f3tfm7yiyjc>
X-Proofpoint-GUID: BnjQIPnV8HRbxQtkISEhybZil0gQdOz7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX6B/G89CDOoLy
 amTdcJJiju+l0op6UZTFVWJYDYpzDQQ3NnD/c5M182E6X5c4Ha+EmQLnjsu9RFVoQlCb2s+hgQm
 08gDiUEoD5AcWnJNVYvwOfLANWYlxRdblyi9ph3N1YwgqcUrZg08eI18gV/YdIhtUhTDvIA2BJN
 xEFvtJQ7kU3nPecREySUn8mCq8m3Gj4gpcKZZDBm9SXHiqc0UySJa0YMQrP+7wjCVVU55Ij6tdN
 jafnh0/0u85Nz/yJUb5K3z1DN511iRu9nG9JzNYQeHAZ0j/o2PzIgR/ziRYYZ5W6q7RM92crhYf
 ca7Qd6qsHdyU4g8DO5E5cXJKcohVW8wDW7ykQpLkqeHCCeNMh3WdC1ZY1Ygvk7vh54399Al+3AN
 hGd77n38GFLgryEpInNICP1emPx3Fg==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f9716e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=Cw9dS9RSUmV-52qKxfUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BnjQIPnV8HRbxQtkISEhybZil0gQdOz7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

On Wed, Oct 22, 2025 at 05:42:58PM -0500, Bjorn Andersson wrote:
> On Wed, Oct 22, 2025 at 12:34:58PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Oct 22, 2025 at 05:05:30PM +0800, Jingyi Wang wrote:
> > > 
> > > 
> > > On 10/22/2025 4:49 PM, Dmitry Baryshkov wrote:
> > > > On Wed, Oct 22, 2025 at 12:28:41AM -0700, Jingyi Wang wrote:
> > > >> Document qcom,kaanapali-imem compatible.
> > > >>
> > > >> Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>
> > > >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > >> ---
> > > >>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
> > > >>  1 file changed, 1 insertion(+)
> > > >>
> > > >> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> > > >> index 6a627c57ae2f..1e29a8ff287f 100644
> > > >> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> > > >> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
> > > >> @@ -19,6 +19,7 @@ properties:
> > > >>        - enum:
> > > >>            - qcom,apq8064-imem
> > > >>            - qcom,ipq5424-imem
> > > >> +          - qcom,kaanapali-imem
> > > > 
> > > > Can you use mmio-sram instead?
> > > > 
> > > 
> > > Here is the node: 
> > > 
> > > 		sram@14680000 {
> > > 			compatible = "qcom,kaanapali-imem", "syscon", "simple-mfd";
> > > 			reg = <0x0 0x14680000 0x0 0x1000>;
> > > 			ranges = <0 0 0x14680000 0x1000>;
> > > 
> > > 			#address-cells = <1>;
> > > 			#size-cells = <1>;
> > > 
> > > 			pil-reloc@94c {
> > > 				compatible = "qcom,pil-reloc-info";
> > > 				reg = <0x94c 0xc8>;
> > > 			};
> > > 		};
> > > 
> > > other qualcomm are also using imem, could you please give more details on why
> > > we should use mmio-sram here?
> > 
> > https://lore.kernel.org/linux-arm-msm/e4c5ecc3-fd97-4b13-a057-bb1a3b7f9207@kernel.org/
> > 
> 
> I considered exactly this when I wrote the binding back then...
> 
> But the binding defines mmio-sram as "Simple IO memory regions to be
> managed by the genalloc API." and the Linux sram driver follows that and
> registers a gen_pool across the sram memory region.
> 
> I believe IMEM is SRAM (it's at least not registers), but its memory
> layout is fixed, so it's not a pool in any form.
> 
> 
> What Krzysztof says makes sense, but rather than just throwing a yak at
> Jingyi, it would be nice if you provided some guidance on how you would
> like to see this turn out.

I tested, pretty same approach seems to work:

	sram@14680000 {
		compatible = "mmio-sram";
		reg = <0x0 0x14680000 0x0 0x1000>;
		ranges = <0 0 0x14680000 0x1000>;

		#address-cells = <1>;
		#size-cells = <1>;

		pil-reloc-sram@94c {
			compatible = "qcom,pil-reloc-info";
			reg = <0x94c 0xc8>;
		};
	};


-- 
With best wishes
Dmitry

