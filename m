Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5913A5B09B1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 18:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbiIGQFk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 12:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbiIGQFM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 12:05:12 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C530B8F25
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 09:03:54 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id ay39-20020a05600c1e2700b003a5503a80cfso9833356wmb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 09:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=WiZQe4b4mRuAd/zv7pDCJ8JJkyV6r0IdO0/F9CJiw9I=;
        b=XPnBPMmL4wfDXjByUHY12axIC/LGlrN3KgzzwycVmhxCnuVC4R4cDdlJ1Y10PlOXqU
         LokekovxKyeg7I2+HeCLWTDM/T5GQgTJHSt5NrM0fYGXLrbES+hW+5nrRm6WJpTqPx8A
         Ur3LSAQ9dtw8IhEWH0v/EFbLSDWK1zDQwCoDj4YQo+7JiTd5m9dP08hza8VTRpzLLsBU
         cM7DoWJJ3Wn/ZDWrtjl4SbuxbhmQ7QcFHiShRQG2DaLXtIznTY7yH8R6Qt6QjTWsVCXM
         NqAiXPSSE3TRIhx9WQF5MD0zWS3xuIg0evyCG+ZbsX33w5GRQ0oHp4QiFzMbuXoOejsN
         cDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=WiZQe4b4mRuAd/zv7pDCJ8JJkyV6r0IdO0/F9CJiw9I=;
        b=rP0HZ/Ra5qv8MCBjnjwPjQGOC3OiajHYLrzfRdZvyJsVopXYIHe1iDzCShZonYiefz
         fTnPWqj4LtzbAE5PpyMVf8X1Nq6f88dX1A1nY+rWeehNGD0fFvE4benlHaAUplAZ9INb
         8HfQ4EPurC/iVjtlAJxwTGpwmVC3oIwiEUIaJy16Q9AkjIRUucPP+MfZZgWrx8BKy5Tz
         5Pz4s0riQKsJcHHOoWqCeFFtBG+pDXV8cM0gEIKlH4KjUE5P8jTefulVD9uo4x3Wl/zi
         IMmDzQ1LhWM6UFGQlGSabb52XcfV54bL5wComYcm9TEK8EDQE0S/yoYkGt32e9IQbenb
         nrKg==
X-Gm-Message-State: ACgBeo0zIuEqnUCkYWMe4G8kmyr8l7ib6QhvVmllkv9c66RG3YzmwLdu
        hgHlO9XHGvJ0a5OUAiWSYnjsOAlMXtn2nA==
X-Google-Smtp-Source: AA6agR6wIdUK9HUfjWvzzXFQzm0kDbR/kmLgsS/G1yPjQu5F8WGuaubNDe8mSDfkkzjTf20TMl5D9A==
X-Received: by 2002:a05:600c:1c95:b0:3a5:c28a:df3e with SMTP id k21-20020a05600c1c9500b003a5c28adf3emr2536485wms.40.1662566632430;
        Wed, 07 Sep 2022 09:03:52 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y22-20020a7bcd96000000b003a54f1d007csm18596691wmj.10.2022.09.07.09.03.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 09:03:51 -0700 (PDT)
Message-ID: <a0388d8c-65fc-28e9-be5e-d75d576f5de0@linaro.org>
Date:   Wed, 7 Sep 2022 17:03:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Using CCI_I2C Driver for OV9282 on Qualcomm RB5 Vision Kit
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     "halil.karabacak" <halil.karabacak@boun.edu.tr>
Cc:     Linux arm msm <linux-arm-msm@vger.kernel.org>
References: <e4bf306f4c275655f3fbe577f48fb616@boun.edu.tr>
 <916574e1-ed62-cf92-a0ba-e7baf1a3f85c@linaro.org>
 <1ecd2058040c8e087ab1e0c34d3aac2d@boun.edu.tr>
 <69bdc9d7b5556575bf38cc6adc100e4a@boun.edu.tr>
 <23b50db5-e0e3-700f-40b5-3efb25735dfc@linaro.org>
In-Reply-To: <23b50db5-e0e3-700f-40b5-3efb25735dfc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/08/2022 14:34, Bryan O'Donoghue wrote:
> On 24/08/2022 12:08, halil.karabacak wrote:
>> After some trials and errors, I achieved something but, are these 
>> resolutions in the attached file correct? And I could read nothing 
>> from the camera right now.
>> Regards,
>> Halil
> 
> They don't look right.
> 
> Are you trying with the imx577 or the ov9282 ?

So I had a poke at the ov9282 today.

ov9282 is detected on this branch here.

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=linux-stable-22-08-01-imx577-camss

libcamera can't eat Y10P though
[1]

Ongoing irritant is that i2c addresses are right shifted by 1 bit in 
addressing so imx577@x34 is imx577@0x1a and ov9282@0xC0 is ov9282@0x60, 
we should fix that, its very confusing.

Anyway I thought I'd share

---
bod

[1]

root@linaro-gnome:/home/linaro/libcamera/build/src# ./cam/cam -l
[0:08:23.443968209] [3393]  INFO IPAManager ipa_manager.cpp:138 
libcamera is not installed. Adding 
'/home/linaro/libcamera/build/src/ipa' to the IPA search path
[0:08:23.489820187] [3393]  INFO Camera camera_manager.cpp:293 libcamera 
v0.0.0+3222-1b30992b
[0:08:23.506972394] [3396]  WARN CameraSensor camera_sensor.cpp:197 
'ov9282 21-0060': Recommended V4L2 control 0x009a0922 not supported
[0:08:23.507017863] [3396] ERROR V4L2 v4l2_subdevice.cpp:286 'ov9282 
21-0060': Unable to get rectangle 2 on pad 0: Inappropriate ioctl for device
[0:08:23.507044685] [3396]  WARN CameraSensor camera_sensor.cpp:224 
'ov9282 21-0060': The PixelArraySize property has been defaulted to 1280x720
[0:08:23.507067862] [3396] ERROR V4L2 v4l2_subdevice.cpp:286 'ov9282 
21-0060': Unable to get rectangle 1 on pad 0: Inappropriate ioctl for device
[0:08:23.507087393] [3396]  WARN CameraSensor camera_sensor.cpp:235 
'ov9282 21-0060': The PixelArrayActiveAreas property has been defaulted 
to (0x0)/1280x720
[0:08:23.507114372] [3396] ERROR V4L2 v4l2_subdevice.cpp:286 'ov9282 
21-0060': Unable to get rectangle 0 on pad 0: Inappropriate ioctl for device
[0:08:23.507131664] [3396]  WARN CameraSensor camera_sensor.cpp:243 
'ov9282 21-0060': Failed to retrieve the sensor crop rectangle
[0:08:23.507148382] [3396]  WARN CameraSensor camera_sensor.cpp:249 
'ov9282 21-0060': The sensor kernel driver needs to be fixed
[0:08:23.507170622] [3396]  WARN CameraSensor camera_sensor.cpp:251 
'ov9282 21-0060': See Documentation/sensor_driver_requirements.rst in 
the libcamera sources for more information
[0:08:23.508584465] [3396]  WARN CameraSensorProperties 
camera_sensor_properties.cpp:141 No static properties available for 'ov9282'
[0:08:23.508604829] [3396]  WARN CameraSensorProperties 
camera_sensor_properties.cpp:143 Please consider updating the camera 
sensor properties database
[0:08:23.508616444] [3396]  WARN CameraSensor camera_sensor.cpp:414 
'ov9282 21-0060': Failed to retrieve the camera location
[0:08:23.508987014] [3396]  WARN CameraSensor camera_sensor.cpp:197 
'imx412 22-001a': Recommended V4L2 control 0x009a0922 not supported
[0:08:23.509003941] [3396] ERROR V4L2 v4l2_subdevice.cpp:286 'imx412 
22-001a': Unable to get rectangle 2 on pad 0: Inappropriate ioctl for device
[0:08:23.509015607] [3396]  WARN CameraSensor camera_sensor.cpp:224 
'imx412 22-001a': The PixelArraySize property has been defaulted to 
4056x3040
[0:08:23.509024149] [3396] ERROR V4L2 v4l2_subdevice.cpp:286 'imx412 
22-001a': Unable to get rectangle 1 on pad 0: Inappropriate ioctl for device
[0:08:23.509031649] [3396]  WARN CameraSensor camera_sensor.cpp:235 
'imx412 22-001a': The PixelArrayActiveAreas property has been defaulted 
to (0x0)/4056x3040
[0:08:23.509043107] [3396] ERROR V4L2 v4l2_subdevice.cpp:286 'imx412 
22-001a': Unable to get rectangle 0 on pad 0: Inappropriate ioctl for device
[0:08:23.509050815] [3396]  WARN CameraSensor camera_sensor.cpp:243 
'imx412 22-001a': Failed to retrieve the sensor crop rectangle
[0:08:23.509057482] [3396]  WARN CameraSensor camera_sensor.cpp:249 
'imx412 22-001a': The sensor kernel driver needs to be fixed
[0:08:23.509064148] [3396]  WARN CameraSensor camera_sensor.cpp:251 
'imx412 22-001a': See Documentation/sensor_driver_requirements.rst in 
the libcamera sources for more information
[0:08:23.509659508] [3396]  WARN CameraSensorProperties 
camera_sensor_properties.cpp:141 No static properties available for 'imx412'
[0:08:23.509673102] [3396]  WARN CameraSensorProperties 
camera_sensor_properties.cpp:143 Please consider updating the camera 
sensor properties database
[0:08:23.509682216] [3396]  WARN CameraSensor camera_sensor.cpp:414 
'imx412 22-001a': Failed to retrieve the camera location
[0:08:23.520666868] [3396]  WARN V4L2 v4l2_pixelformat.cpp:287 
Unsupported V4L2 pixel format Y10P
[0:08:23.520719316] [3396] ERROR SimplePipeline simple.cpp:506 No valid 
configuration found
