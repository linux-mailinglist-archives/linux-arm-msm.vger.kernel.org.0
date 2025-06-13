Return-Path: <linux-arm-msm+bounces-61221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC01AD8C3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 14:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B59C51E1002
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 12:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBB94C62;
	Fri, 13 Jun 2025 12:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTgumeVR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50DF469D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749818157; cv=none; b=neD93zM1HixxTk57E71uWG3OKZEfYcLT/EjgguvccQH+EseNFKzT9LyIh1F2dWkUy6mJ9plcF4kcosXEHjWFQFEy/s9mtp9HbNxZloW2jGk5khFGOf3WsN9qPjEYjlALIsBo4zlB54objIfPrMDfifgWGl3d10glYqvEH/Hes5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749818157; c=relaxed/simple;
	bh=evnpni4wnN6XWcEFBmMREu7rCsXzqPgVlA4l2P6pCis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ItKPJpLPAAZcVhMDxa37n2C4r+724dSYVspP5CMTHcwySq9IZJtBRhiuNGrxqLqs4rnVNRcBeynS8M3+jnwdA/ea1pPuJGdJOpTSjmHyPHiLUNmXbJxqtZPqedVdULzL8bVbIswDkBJ+cLSU1oA9EPxPem1zXYc8ekiZZrmLIuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTgumeVR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCQ0Z5002129
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 12:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WsYQZRUCo4zOnQ2i7je/LuU5
	TXPgDyBFxCiw2rjqLac=; b=lTgumeVR9k/tmC/ddW0PfGQ+WDyHje1ZDtm7xjmc
	gsUuaFU5HZN/zeqqWOfAxEBId1qFmVkIgFdiB5wBTfEppOw6Yy+DcKu/34iJDDHV
	UsF/WtfOe2b1TNJZg6fwstSF7iuJXdtRn+RhHbzuVLqGYA5uvxaLvihJeiVDeY4d
	lLdu4H6fe1m27Wq9MDg6fA+KYISbgQg8vNPXj3mx1hnCVrd5v7XfwADicYRpWJfD
	fM4SWWxHfhPKz4DbAKP9BUlVREM8AcyzV2hlmacrWSLw4Malb/U5BFxX1HkiSYT0
	T9wzwGB/NZ8Jcsh5IfUFHs/3sI2oqLvD/tuHGa1T2tY5qg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 478h8krc04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 12:35:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fabd295d12so34414986d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 05:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749818153; x=1750422953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsYQZRUCo4zOnQ2i7je/LuU5TXPgDyBFxCiw2rjqLac=;
        b=wedUMr5hseDjnzEeCQ58xjKgv5mmY0LpaSwrDBjfjz+mimKotAIA/YxL1yIXp1UUNA
         ONd9IOofdOR4r8T45cAl8bcxTQBrdivccDZ8lYChv1SkRCSQFp04VUBD5c5AiMGDmEkG
         u1COisvPrplQH1aF3xxQ8pVOC4JpK+8dOW38Nmnig4wIhGw9MkMAF3cpmzMPKbrDRUWB
         kfJXb5HLT3jYOGSEXYRIPdFEzovtmNS69+0QEfuwXVj0Gk0F8hSvvrnqNNiwohJ4AwHR
         rh0dscGQXhb5itP4Jzgu4iHbaxM9Ny8SHuARvUKF6Ahd0XHYvtIk/WQ1Bt+1WSQZ0zjT
         Qi7g==
X-Forwarded-Encrypted: i=1; AJvYcCW/04QCiPy/sGSp+9vUj/IxpJV+5lYS63y/zYqPrhwBz/oTk4UwV5C5gknlrp7GXkbbcqmgSIyhQk8NgDN2@vger.kernel.org
X-Gm-Message-State: AOJu0YyuPgfmQ7ONuIBpo/LYbUSHG98eHEnRoXTzmddvXbWaTi4AIeqt
	nL23q9UNUDsdgQAr9ChzCU03A2gXbVb3ucboSLjP74+sS7e7AsDnOhfEDYBOK4jen7UV1a3dccO
	A78U/ZxUOEHVP3vc184t5Tru7jmMl0rLscHl4HDxtOoAwfibeiVo81Dt6xV8QTbb8n7Bz
X-Gm-Gg: ASbGncurh7S5zpIe6lO+5vT+XKP0sYpjB/h7Wc3Yft0/hPt5gwyE+ec/61p/SckNlZv
	npKV07fxkqyMF61FFji6ZxcrpWG7E1ykY7xqb+THy7VIqezyPBKkTx9WFByFoFzj0XABJ7dAitD
	i/WSJsOP4YNgmbWBRS58ZNvNDNLzcPLfeM61QHikRAhMwjuBqqGLlSDsnSXwZgJB5DLuJ5I7yny
	/zfLwnEqFCqwCqdKZFjiQx33gSYhtQUixb6D5HpsK/F0rloKXMPlDzZN5GmAUlb8vUdHD7Lfsg9
	93j5a2Bj0uQdV+YOsPJYIW2wu7I/qVn2aA+SOgkjB0uM06SNpCmJj/ACcAEmdG4CvuUsVRUSLAz
	Ppxm4ZAew8Vb5RjE8BGtGtuCtv77h99SmYuM=
X-Received: by 2002:a05:6214:e61:b0:6f8:bfbf:5d29 with SMTP id 6a1803df08f44-6fb3e59a1d0mr42985126d6.5.1749818153500;
        Fri, 13 Jun 2025 05:35:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpyFqBMik1QQtfT6MCUWO935nh/3L7C7bc/r71q3tiGCsZjP1J0QLvqfJQvqkAkrocnsEx8Q==
X-Received: by 2002:a05:6214:e61:b0:6f8:bfbf:5d29 with SMTP id 6a1803df08f44-6fb3e59a1d0mr42984786d6.5.1749818153072;
        Fri, 13 Jun 2025 05:35:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1ab60dsm433018e87.131.2025.06.13.05.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 05:35:51 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:35:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: amitk@kernel.org, daniel.lezcano@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        devicetree@vger.kernel.org, =linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615: Enable TSENS support
 for QCS615 SoC
Message-ID: <dlgoyqau7xriqr5q77xxt5fqwtym4jnosqcunrfdbgg77mcguk@dc3336sdxzfv>
References: <20250613112402.2203617-1-quic_gkohli@quicinc.com>
 <20250613112402.2203617-3-quic_gkohli@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613112402.2203617-3-quic_gkohli@quicinc.com>
X-Proofpoint-ORIG-GUID: lZmk2QRJE8pORSo8YiW6Elm_hBaRmLlG
X-Proofpoint-GUID: lZmk2QRJE8pORSo8YiW6Elm_hBaRmLlG
X-Authority-Analysis: v=2.4 cv=Pp2TbxM3 c=1 sm=1 tr=0 ts=684c1b2a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KqgFOdr7Lw3KfjHT3UMA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA5MSBTYWx0ZWRfX5m+D44GhMOf1
 3FUJCUi8EAo0jXj7X+vXZKPWPysCqvoJHle5Djx6liBzd2wfdKX+278aaLG1bWey180PCehATIo
 sV5CHksY0ZNym8zqzQVa1iWo6SY/6rm0QknyrcosS66N8ZXrLQkMNlQri3YjQp1d54JFrHNI0a4
 h4F74Q30a2M2yGs8pIttJKKWas8V7O1Rm+vralWWs84+HriYvJh6pUaLEY9gcPcuiO78TOfpjKM
 7hwW1iY2AdGMzU7xl/Jp23cnOu/qvhNpTeYblI8HOn2KHVGAAuU5XZKg66xAz4yTtZSabpc/Ezj
 ooLt2S1LmFRK2jM9B+EwsSiZAo/x3D+nK1PTur+I9nGNBP8ki+VybkwmuvpQ55BnihsASPiLih5
 TJZyBBVY6R+NO5szaJznBlTPydLFnfM59ynxVKyiCanux5nZtFHqtcHvwJ3lfkX1X/6F0xBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=793 mlxscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130091

On Fri, Jun 13, 2025 at 04:54:02PM +0530, Gaurav Kohli wrote:
> Add TSENS and thermal devicetree node for QCS615 SoC.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> 

Please don't edit the patches when sending. You seem to have removed the
diffstat. That doesn't help the reviewers.

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index bb8b6c3ebd03..fda8b8638718 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -3692,6 +3692,17 @@ usb_2_dwc3: usb@a800000 {
>  				maximum-speed = "high-speed";
>  			};
>  		};
> +
> +		tsens0: tsens@c222000 {
> +			compatible = "qcom,qcs615-tsens", "qcom,tsens-v2";
> +			reg = <0x0 0x0c263000 0x0 0x1ff>,
> +				<0x0 0x0c222000 0x0 0x8>;
> +			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow", "critical";
> +			#qcom,sensors = <16>;
> +			#thermal-sensor-cells = <1>;
> +		};
>  	};
>  
>  	arch_timer: timer {
> @@ -3701,4 +3712,198 @@ arch_timer: timer {
>  			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
>  			     <GIC_PPI 0 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
> +
> +	thermal-zones {
> +		aoss-thermal {
> +			thermal-sensors = <&tsens0 0>;
> +
> +			trips {
> +				aoss-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cpuss-0-thermal {
> +			thermal-sensors = <&tsens0 1>;
> +
> +			trips {
> +				cpuss0-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cpuss-1-thermal {
> +			thermal-sensors = <&tsens0 2>;
> +
> +			trips {
> +				cpuss1-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cpuss-2-thermal {
> +			thermal-sensors = <&tsens0 3>;
> +
> +			trips {
> +				cpuss2-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cpuss-3-thermal {
> +			thermal-sensors = <&tsens0 4>;
> +
> +			trips {
> +				cpuss3-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cpu-1-0-thermal {
> +			thermal-sensors = <&tsens0 5>;
> +
> +			trips {
> +				cpu-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cpu-1-1-thermal {
> +			thermal-sensors = <&tsens0 6>;
> +
> +			trips {
> +				cpu-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cpu-1-2-thermal {
> +			thermal-sensors = <&tsens0 7>;
> +
> +			trips {
> +				cpu-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cpu-1-3-thermal {
> +			thermal-sensors = <&tsens0 8>;
> +
> +			trips {
> +				cpu-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		gpu-thermal {
> +			thermal-sensors = <&tsens0 9>;
> +
> +			trips {
> +				gpu-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		q6-hvx-thermal {
> +			thermal-sensors = <&tsens0 10>;
> +
> +			trips {
> +				q6-hvx-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		mdm-core-thermal {
> +			thermal-sensors = <&tsens0 11>;
> +
> +			trips {
> +				mdm-core-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		camera-thermal {
> +			thermal-sensors = <&tsens0 12>;
> +
> +			trips {
> +				camera-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		wlan-thermal {
> +			thermal-sensors = <&tsens0 13>;
> +
> +			trips {
> +				wlan-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		display-thermal {
> +			thermal-sensors = <&tsens0 14>;
> +
> +			trips {
> +				display-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		video-thermal {
> +			thermal-sensors = <&tsens0 15>;
> +
> +			trips {
> +				video-critical {
> +					temperature = <115000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};
>  };
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

